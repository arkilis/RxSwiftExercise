//
//  RXSwiftExerciseTests.swift
//  RXSwiftExerciseTests
//
//  Created by Ben Liu on 6/3/2023.
//

import XCTest
@testable import RXSwiftExercise

final class RXSwiftExerciseTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  func testExample() throws {
    let viewModel = ViewModel()
    XCTAssertTrue(viewModel.validateEmail(email: "1@abc.com"))
    XCTAssertFalse(viewModel.validateMobile(mobile: "12345678900"))
  }
}
