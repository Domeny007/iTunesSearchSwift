//
//  SearchTest.swift
//  SearchTest
//
//  Created by Азат Алекбаев on 11.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import XCTest

class SearchTest: XCTestCase {
    
      var app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        app.launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSearch() {
        
        let searchSearchField = app.tables["Empty list"].searchFields["Search"]
        searchSearchField.tap()
        
        let kKey = app/*@START_MENU_TOKEN@*/.keys["K"]/*[[".keyboards.keys[\"K\"]",".keys[\"K\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        kKey.tap()
        let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()
        app.keyboards.buttons["Search"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Home Cooking with Jean-Georges"]/*[[".cells.staticTexts[\"Home Cooking with Jean-Georges\"]",".staticTexts[\"Home Cooking with Jean-Georges\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        // dono what to test...
    }

    func testSettings() {
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["More"].tap()
        app/*@START_MENU_TOKEN@*/.pickerWheels["music"]/*[[".pickers.pickerWheels[\"music\"]",".pickerWheels[\"music\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        app/*@START_MENU_TOKEN@*/.pickerWheels["1"]/*[[".pickers.pickerWheels[\"1\"]",".pickerWheels[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tabBarsQuery.buttons["Search"].tap()
        let searchSearchField = app.tables["Empty list"].searchFields["Search"]
        searchSearchField.tap()
        
        let kKey = app/*@START_MENU_TOKEN@*/.keys["K"]/*[[".keyboards.keys[\"K\"]",".keys[\"K\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        kKey.tap()
        let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()
        app.keyboards.buttons["Search"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Home Cooking with Jean-Georges"]/*[[".cells.staticTexts[\"Home Cooking with Jean-Georges\"]",".staticTexts[\"Home Cooking with Jean-Georges\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
}

