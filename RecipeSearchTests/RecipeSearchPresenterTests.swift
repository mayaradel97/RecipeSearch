//
//  RecipeSearchTests.swift
//  RecipeSearchTests
//
//  Created by Mayar Adel on 5/29/22.
//

import XCTest
@testable import RecipeSearch
class RecipeSearchPresenterTests: XCTestCase {
    
    var interactor: RecipeSearchInteractor!
    var presenter: RecipeSearchPresenter!
    var router: RecipeSearchRouter!
    
    
    override func setUpWithError() throws {
        let view: RecipeSearchViewController = .instantiate(storyboardName: Constant.RecipeSearchStoryboard.rawValue)
        view.loadView()
        view.searchController = UISearchController()
        interactor = RecipeSearchInteractor()
        router = RecipeSearchRouter(window: UIWindow())
        presenter = RecipeSearchPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
    }
    
    override func tearDownWithError() throws {
        interactor = nil
        router = nil
        presenter = nil
    }
    
    func testValidSearch() throws {
        
        let expectaions = expectation(description: "waiting for response")
        presenter.getRecipes(searchText: "chicken", filter: Filter.Keto.healthFilter)
        let result = XCTWaiter.wait(for: [expectaions], timeout: 10)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertGreaterThan(presenter.numberOfRecipes, 0)
            
        } else {
            XCTFail("Delay interrupted")
        }
        
    }
    
    func testInvalidSearch() throws {
        
        let expectaions = expectation(description: "waiting for response")
        presenter.getRecipes(searchText: "فراخ", filter: nil)
        let result = XCTWaiter.wait(for: [expectaions], timeout: 10)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(presenter.numberOfRecipes, 0)
        } else {
            XCTFail("Delay interrupted")
        }
        
    }
    
    
}
