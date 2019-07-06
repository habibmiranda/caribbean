//
//  strings.swift
//  Caribbean
//
//  Created by Habib Miranda-Garcia on 7/2/19.
//  Copyright © 2019 Habib Miranda-Garcia. All rights reserved.
//

import Foundation

public enum apiStrings {
    static let baseURL = "https://restcountries-v1.p.rapidapi.com/"
    static let regionURL = "subregion/caribbean"
    static let key = "4353d41e68msh7f7a0f5bebe4057p1a4902jsn1069421b8338"
    static let host = "restcountries-v1.p.rapidapi.com"
    static let keyHeader = "X-RapidAPI-Key"
    static let hostHeader = "X-RapidAPI-Host"
}

public enum navStrings {
    static let toCountryDetail = "showCountryDetail"
    static let listCellID = "ListCell"
    static let countryCellNib = "ListTableViewCell"
    static let detailCellID = "detailCell"
    static let detailCellNib = "DetailTableViewCell"
}
