//
//  SignupViewController.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-25.
//  Copyright © 2015 Noms. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
}

//MARK: @IBActions
private extension SignupViewController {
    //signup parse
    @IBAction func getAccountButtonPressed(sender: UIButton) {
    }
    
    @IBAction func goToLoginButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}