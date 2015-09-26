//
//  ViewController.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-25.
//  Copyright © 2015 Noms. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
}

//MARK: @IBActions
//This extension is private as nobody else outside of class needs to access the @IBActions
private extension InitialViewController {
    //login
    @IBAction func logInButtonPressed(sender: UIButton) {
        
    }
    
    //reset password
    @IBAction func resetPasswordButtonPressed(sender: UIButton) {
    }
    
    //signup
    @IBAction func getAnAccountButtonPressed(sender: UIButton) {
    }
}