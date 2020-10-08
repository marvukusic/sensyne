//
//  SensyneTechTestTests.swift
//  SensyneTechTestTests
//
//  Created by Marko Vukusic on 07/10/2020.
//

import XCTest
@testable import SensyneTechTest

class SensyneTechTestTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testNetworkService() {
        let networkService = NetworkService()
        
        let hospitalList = networkService.getHospitalList(test: true)
        
        XCTAssertEqual(hospitalList.count, 1198, "Hospital list is not loaded correctly")
    }
}
