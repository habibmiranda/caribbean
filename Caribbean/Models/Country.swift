//
//  Country.swift
//  Caribbean
//
//  Created by Habib Miranda-Garcia on 7/2/19.
//  Copyright © 2019 Habib Miranda-Garcia. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String
    let capital: String
    let population: Int
    let languages: [String]
    let currencies: [String]
    let latlng: [Double]?
}

// MARK: TypeAlias for details
typealias CountryDetail = (title: String, value: String)

extension Country {
    var detailRepresentation: [CountryDetail] {
        return [
            ("Name: ", name),
            ("Capital: ", capital),
            ("Population: ", String(population)),
            ("Languages: ", languages.joined(separator: ", ")),
            ("Currencies: ", currencies.joined(separator: ", "))
        ]
    }
}
