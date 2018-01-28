//
//  LoginViewController.swift
//  Eten
//
//  Created by Jackson Meyer on 1/27/18.
//  Copyright © 2018 Jackson Meyer. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    var email = ""
    var password = ""
    
    @IBOutlet weak var emailTexField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var sege: UISegmentedControl!
    
    @IBAction func segmentedChanged(_ sender: Any) {
        
    }
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButton(_ sender: Any) {
        handleLogin()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func handleLogin() {
        email = emailTexField.text!
        password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error!)
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                self.present(alert, animated: true, completion: nil)
                
                alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: { action in
                    switch action.style{
                    case .cancel:
                        self.loginButton.isEnabled = true
                        print("cancel")
                    case .default:
                        self.loginButton.isEnabled = true
                        print("default case")
                    case .destructive:
                        self.loginButton.isEnabled = true
                        print("destructive case")
                    }
                }))
            } else {
                if self.sege.selectedSegmentIndex == 0 {
                    
                    self.performSegue(withIdentifier: "LogInToMain", sender: nil)
                    
                } else {
                    
                    self.performSegue(withIdentifier: "LoginToBusiness", sender: nil)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
