//
//  SignUpViewController.swift
//  Eten
//
//  Created by Jackson Meyer on 1/27/18.
//  Copyright © 2018 Jackson Meyer. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    var signUpType = "user"
    var name = ""
    var email = ""
    var password = ""
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentedControlChange(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            print("user")
            signUpType = "user"
        } else {
            print("business")
            signUpType = "business"
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        signUpButton.isEnabled = false
        name = nameTextField.text!
        email = emailTextField.text!
        password = passwordTextField.text!
    
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print(error!)
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                self.present(alert, animated: true, completion: nil)
                
                alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: { action in
                    switch action.style{
                    case .cancel:
                        self.signUpButton.isEnabled = true
                        print("cancel")
                    case .default:
                        self.signUpButton.isEnabled = true
                        print("default case")
                    case .destructive:
                        self.signUpButton.isEnabled = true
                        print("destructive case")
                    }
                }))
            } else {
                if self.signUpType != "user" {
                    self.handleCreateBusinessAccount()
                } else {
                    self.handleCreateUserAccount()
                }
            }
        })
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func handleCreateUserAccount() {
        print("handle Create Account")
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        let userInfo = Auth.auth().currentUser
        let uid = userInfo?.uid
        
        let emptyArray = [String]()
        
        let newUser = User(name: "", profilePic: "", reviews: emptyArray)
        
        ref.child("users").child(uid!).setValue(newUser.toAnyObject())
        
        self.performSegue(withIdentifier: "SignUpToMain", sender: nil)
    }
    
    func handleCreateBusinessAccount() {
        print("handle Create Business Account")
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        let userInfo = Auth.auth().currentUser
        let uid = userInfo?.uid
        
        let emptyArray = [String]()
        
        let newBusiness = Business(businessName: "", address: "", profilePic: "", eateryStyle: "", foodServed: "", businessHours: emptyArray)
        
        ref.child("businesses").child(uid!).setValue(newBusiness.toAnyObject())
        
        self.performSegue(withIdentifier: "SignUpToBusiness", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
}
