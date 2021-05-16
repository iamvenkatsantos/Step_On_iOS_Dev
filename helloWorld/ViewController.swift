//
//  ViewController.swift
//  helloWorld
//
//  Created by Venkatesh Rajendran on 14/05/21.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event:UIEvent? ){
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

