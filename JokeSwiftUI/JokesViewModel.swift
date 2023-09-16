//
//  JokesViewModel.swift
//  JokeSwiftUI
//
//  Created by Atil Samancioglu on 7.08.2022.
//

import Foundation
import Alamofire // bu kütüphane networking işine yarar yani istek attık cevap geldi isteğin içine header koyduk parametre verdik vs işlemlerini kolay yapmamıza olanak tanır. bunu urlsession la da yapabiliriz ama biz yaptığımız uygulamalarda bi iki tane istek atıyoduk. ortalama bi uygulamada şirkette en az 60-70 tane istek atılır. çok fazla istek olan yerde daha verimli çalışmak için Alamofire kullanırız. bu uygulama da urlsessionla yapılabilir ama biz alamofire kullanıcaz

class JokesViewModel : ObservableObject{ // ObservableObject, istediğimiz değişken ya da parametreleri publish edebilceğimiz/yayın yapabilceğimiz, böylelikle view tarafında yayın yapan gözlenebilenlere bir gözlemci varsa yani oradaki değişiklikleri gözlemliyorlarsa, buradaki değişiklikler otomatik olarak view a aktarılacak ve view da kendini baştan oluşturucak, kullanıcıya gösterebilicez
    
    @Published var jokes = [Value]() // bunu @Published ederek contentview içinde gözlemleyebilicez. value içinde şakaları tutan bi dizi

    init() {
        getJokes()
    }
    
    func getJokes(count: Int = 6)
    {
        AF.request("http://api.icndb.com/jokes/random/\(count)",method: .get).responseDecodable(of:Welcome.self) { response in // istek atıyoruz. \(count) bu kısıma sayı da yazabilirdik. web servisi sağlayan kişiler kaç tane şaka geliceğini belirtmek için yapmışlar. of:Welcome.self burada of bize nereden decode edileceğini sorar
            // http olan, https olmayan bi adrese istek atıyosak bunu infoplist içinde belirtmek gerek o yüzden infoya(proje ayarlarında info dan ulaşabiliriz) app transport security settings i eklemek gerekiyor. sonra onun altında allow arbitrary loads u seçip yes yapmak gerek
            switch response.result {
                case .success(let data):
                let value = data.value // jokes içerisinde şaka varsa üzerine ekliycek
                self.jokes += value
                case .failure(let error):
                    print(error)
            }
        }
    }
}
