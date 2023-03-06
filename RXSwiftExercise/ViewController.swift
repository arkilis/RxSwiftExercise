//
//  ViewController.swift
//  RXSwiftExercise
//
//  Created by Ben Liu on 6/3/2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var emailErrorInfo: UILabel!
  
  @IBOutlet weak var mobileTextField: UITextField!
  @IBOutlet weak var mobileErrorInfo: UILabel!
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    setupBinding()
  }
  
  func setupBinding() {
    emailTextField.rx.text.changed.subscribe(onNext: {
      guard let text = $0 else { return }
      self.emailErrorInfo.text = text.contains("!") ? "Invalid character" : ""
    }).disposed(by: disposeBag)
    
    
    mobileTextField.rx.text.changed.subscribe(onNext: {
      guard let text = $0 else { return }
      self.mobileErrorInfo.text = text.contains("@") ? "Invalid character" : ""
    }).disposed(by: disposeBag)
  }
}

