//
//  JokesData.swift
//  JokeSwiftUI
//
//  Created by Atil Samancioglu on 7.08.2022.
//

import Foundation

// hoca otomatik model kodları yazan bi site önerdi : https://app.quicktype.io. kodları oradan kopyaladı

// MARK: - Welcome
struct Welcome: Identifiable, Codable { // objemiz bi type bir de value dan oluşuyor. Codable yazıyoruz çünkü decode edicez
    let id = UUID()
    let type: String
    let value: [Value] // bunu [Value] bu şekilde yazarsak, birden fazla value geliceğini decode etmiş oluruz
}

// MARK: - Value
struct Value: Identifiable, Codable {
    let id: Int
    let joke: String
    let categories: [String]
}
