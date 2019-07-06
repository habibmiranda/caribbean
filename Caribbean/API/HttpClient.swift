//
//  HttpClient.swift
//  Caribbean
//
//  Created by Habib Miranda-Garcia on 7/5/19.
//  Copyright © 2019 Habib Miranda-Garcia. All rights reserved.
//

import Foundation

class HttpClient {
    
    func getRequest(_ session: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: session) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    guard let jsonString = dataString.data(using: .utf8) else {
                        return
                    }
                    completion(.success(jsonString))
                }
            }
        }
        task.resume()
    }
}
