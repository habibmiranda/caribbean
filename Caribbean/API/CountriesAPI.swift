//
//  CountriesAPI.swift
//  Caribbean
//
//  Created by Habib Miranda-Garcia on 7/2/19.
//  Copyright © 2019 Habib Miranda-Garcia. All rights reserved.
//

import Foundation

class CountriesAPI {
    
    let httpClient = HttpClient()
    
    static let shared = CountriesAPI()
    private init() {}
    
    let baseURL: String = apiStrings.baseURL
    let regionSubstring: String = apiStrings.regionURL
    
    func getRequest(completion: @escaping (_ countries: [Country]?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: "\(baseURL)\(regionSubstring)") else {
            print("Error creating URL")
            return
        }
        
        var session = URLRequest(url: url)
        session.addValue(apiStrings.host, forHTTPHeaderField: apiStrings.hostHeader)
        session.addValue(apiStrings.key, forHTTPHeaderField: apiStrings.keyHeader)
        
        httpClient.getRequest(session) { result in
            switch result {
            case .success(let data):
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data!)
                    return completion(countries, nil)
                } catch {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
