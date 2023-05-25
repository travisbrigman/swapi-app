//
//  SWAPITests.swift
//  SWAPITests
//
//  Created by Travis Brigman on 5/25/23.
//

import XCTest
@testable import SWAPI

final class SWAPITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor func testPostSuccessfulScan() {
        // GIVEN
        let viewModel = ContentViewModel(reqresService: ReqresService())
        let resultString = "serial=277933029232101186,versionCode=5006077,versionName=5.6.77"
        let mockResult = MyScanResult(string: resultString, type: .qr, image: nil)
        
        // WHEN
        viewModel.postSuccessfulScan(successfulResult: mockResult)
        
        let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(block: { _, _ in
            viewModel.isPresentingSheet == false
        }), object: nil)
        
        wait(for: [expectation], timeout: 1.5)
        
        // THEN
        // Assert something here...
        
    }
    
}
