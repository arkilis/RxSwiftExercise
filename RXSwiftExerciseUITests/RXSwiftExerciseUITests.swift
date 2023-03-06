//
//  RXSwiftExerciseUITests.swift
//  RXSwiftExerciseUITests
//
//  Created by Ben Liu on 6/3/2023.
//

import XCTest

final class RXSwiftExerciseUITests: XCTestCase {
  
  override func setUpWithError() throws {
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testTextFields() throws {
    let app = XCUIApplication()
    app.launch()
    
    // test email
    let emailTextField = app.textFields["email"]
    emailTextField.tap()
    emailTextField.typeText("123")
    
    let emailErrorLabel = app.staticTexts["emailError"]
    
    
    emailTextField.tap()
    emailTextField.typeText("!")
    XCTAssertEqual(emailErrorLabel.label, "Invalid character")
    
    // test mobile
    let mobileTextField = app.textFields["mobile"]
    mobileTextField.tap()
    mobileTextField.typeText("456")
    
    let mobileErrorLabel = app.staticTexts["mobileError"]
    
    
    mobileTextField.tap()
    mobileTextField.typeText("@")
    XCTAssertEqual(mobileErrorLabel.label, "Invalid character")
  }
}
