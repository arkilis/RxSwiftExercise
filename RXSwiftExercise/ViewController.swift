//
//  ViewController.swift
//  RXSwiftExercise
//
//  Created by Ben Liu on 6/3/2023.
//

import UIKit
import RxSwift
import RxCocoa

enum MyError: Error {
  case someError
}

class ViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var emailErrorInfo: UILabel!
  
  @IBOutlet weak var mobileTextField: UITextField!
  @IBOutlet weak var mobileErrorInfo: UILabel!
  
  let disposeBag = DisposeBag()
  var viewModel: ViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    viewModel = ViewModel()
    setupBinding()
  }
  
  func setupBinding() {
    emailTextField.rx.text.changed.subscribe(onNext: {
      guard let text = $0, let viewModel = self.viewModel else { return }
      self.emailErrorInfo.text =
      viewModel.validateEmail(email: text) ?
        "" :
        "Invalid character"
    }).disposed(by: disposeBag)
    
    
    mobileTextField.rx.text.changed.subscribe(onNext: {
      guard let text = $0, let viewModel = self.viewModel else { return }
      self.mobileErrorInfo.text =
        viewModel.validateMobile(mobile: text) ?
          "" :
          "Invalid character"
    }).disposed(by: disposeBag)
  }
}

