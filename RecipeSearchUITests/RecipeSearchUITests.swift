//
//  RecipeSearchUITests.swift
//  RecipeSearchUITests
//
//  Created by Mayar Adel on 5/30/22.
//

import XCTest

class RecipeSearchUITests: XCTestCase {

    var app: XCUIApplication!
    override func setUpWithError() throws {
        
        continueAfterFailure = false
           app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testUIOfApplication() throws {
        
       
        app.launch()
        
        //recipe search view
        let searchField = app.navigationBars.element(boundBy: 0).searchFields.element(boundBy: 0)
        let noSearchImage = app.images["noSearchImage"]
        let searchButton =  app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"search\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        
        XCTAssertTrue(searchField.exists)
        XCTAssertTrue(noSearchImage.exists)
        
        searchField.tap()
        searchField.typeText("chicken")
        searchButton.tap()
        
        sleep(5)
        
        XCTAssertFalse(noSearchImage.exists)
        
        let collectionView = app.collectionViews.element(boundBy: 0)
        let tableView = app.tables.element(boundBy: 0)
        
        XCTAssertTrue(collectionView.exists)
        XCTAssertTrue(tableView.exists)
        
        tableView.tap()
        
        //recipe details
        let recipeWebsiteButton = app.buttons["recipeWebsite"]
        let shareButton = app.navigationBars.buttons.element(boundBy: 1)
        let recipeImage = app.images["recipeImage"]
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        
        
        XCTAssertTrue(recipeWebsiteButton.exists)
        XCTAssertTrue(shareButton.exists)
        XCTAssertTrue(recipeImage.exists)
        XCTAssertTrue(backButton.exists)
        
        backButton.tap()
        collectionView.tap()
        
        let loadingIndicator = app.activityIndicators.element(boundBy: 0)
        
        XCTAssertTrue(loadingIndicator.exists)
        
        sleep(5)
        
        XCTAssertFalse(loadingIndicator.exists)

      
    }

    
}
