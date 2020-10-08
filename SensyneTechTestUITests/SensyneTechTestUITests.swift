//
//  SensyneTechTestUITests.swift
//  SensyneTechTestUITests
//
//  Created by Marko Vukusic on 07/10/2020.
//

import XCTest

class SensyneTechTestUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app = XCUIApplication()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() throws {
        app.launch()
        XCTAssertTrue(app.isDisplayingHospitalList)
        
        let myTable = app.tables.matching(identifier: "hospitalListTableView")
        let cell = myTable.cells.element(matching: .cell, identifier: "hospitalListTableViewCell_0")
        cell.tap()
        
        XCTAssertTrue(app.isDisplayingHospitalDetails)
    }
}

extension XCUIApplication {
    var isDisplayingHospitalList: Bool {
        return otherElements["hospitalList"].exists
    }
    
    var isDisplayingHospitalDetails: Bool {
        return otherElements["hospitalDetails"].exists
    }
}
