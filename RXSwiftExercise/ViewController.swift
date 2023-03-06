//
//  ViewController.swift
//  RXSwiftExercise
//
//  Created by Ben Liu on 6/3/2023.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var emailErrorInfo: UILabel!
  
  @IBOutlet weak var mobileTextField: UITextField!
  @IBOutlet weak var mobileErrorInfo: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    
    emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
    
    mobileTextField.addTarget(self, action: #selector(mobileTextFieldDidChange(_:)), for: .editingChanged)
    
  }
  
  @objc func emailTextFieldDidChange(_ textField: UITextField) {
    guard let email = textField.text else {
      return
    }
    if email.contains("!") {
      emailErrorInfo.text = "Invalid character"
    } else {
      emailErrorInfo.text = ""
    }
  }
  
  @objc func mobileTextFieldDidChange(_ textField: UITextField) {
    guard let email = textField.text else {
      return
    }
    if email.contains("@") {
      mobileErrorInfo.text = "Invalid character"
    } else {
      mobileErrorInfo.text = ""
    }
  }
}

