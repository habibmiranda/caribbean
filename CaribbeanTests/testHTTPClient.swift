//
//  testHTTPClient.swift
//  CaribbeanTests
//
//  Created by Habib Miranda-Garcia on 7/2/19.
//  Copyright © 2019 Habib Miranda-Garcia. All rights reserved.
//

import XCTest
@testable import Caribbean

class testHTTPClient: XCTestCase {
    
    var session: URLSession!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testGetRequestData() {
        let httpClient = HttpClient()
        
//        guard let url = URL(string: "sdfsdf\(apiStrings.baseURL)\(apiStrings.regionURL)") else {
//            XCTFail()
//            return
//        }
        
        guard let url = URL(string: "\(apiStrings.baseURL)\(apiStrings.regionURL)") else {
            XCTFail()
            return
        }
        
        var session = URLRequest(url: url)
        session.addValue(apiStrings.host, forHTTPHeaderField: apiStrings.hostHeader)
        session.addValue(apiStrings.key, forHTTPHeaderField: apiStrings.keyHeader)
        
        httpClient.getRequest(session) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data, "There is data!")
            case .failure(let error):
                XCTAssertNil(error, "Error in not nil")
            }
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
