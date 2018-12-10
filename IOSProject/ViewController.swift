//
//  ViewController.swift
//  IOSProject
//
//  Created by Mohammed Patla on 2018-11-27.
//  Copyright © 2018 Mohammed Patla. All rights reserved.
//

import UIKit
//import Alamofire
import FirebaseAuth

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var statusMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FirebaseApp.configure()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    //MARK: Actions
    
    @IBAction func onSignUpPress(_ sender: Any) {
        
        print("Pressed signup button")
        
        // UI: Get the email/password from the text boxes
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // MARK: FB:  Try to create a user using Firebase Authentication
        // This is all boilerplate code copied and pasted from Firebase documentation
        Auth.auth().createUser(withEmail: email, password: password) {
            
            (user, error) in
            
            if (user != nil) {
                // 1. New user created!
                print("Created user: ")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
                
                //2. @TODO: You decide what you want to do next!
                // - do you want to send them to the next page?
                // - maybe ask them to fill in other forms?
                // - show a tutorial?
                
                // 2. So send them to signupPage
                self.performSegue(withIdentifier: "segueB", sender: nil)
                
            }
            else {
                // 1. Error when creating a user
                print("ERROR!")
                print(error?.localizedDescription)
                
                // 2. Show the error in the UI
                self.statusMessage.text = error?.localizedDescription
                
            }
        }
        
    }
    @IBAction func onLoginPress(_ sender: Any) {
        
        print("login button pressed")
        
        
        // UI: Get the email/password from the text boxes
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // MARK: FB:  Try to sign the user in using Firebase Authentication
        // This is all boilerplate code copied and pasted from Firebase documentation
        Auth.auth().signIn(withEmail: email, password: password) {
            
            (user, error) in
            
            if (user != nil) {
                // 1. Found a user!
                print("User signed in! ")
                print("User id: \(user?.user.uid)")
                print("Email: \(user?.user.email)")
                
                // 2. So send them to screen 2!
                self.performSegue(withIdentifier: "segueA", sender: nil)
            }
            else {
                // 1. A problem occured when looking up  the user
                // - doesn't meet password requirements
                // - user already exists
                print("ERROR!")
                print(error?.localizedDescription)
                
                // 2. Show the error in user interface
                self.statusMessage.text = error?.localizedDescription
            }
        }
    }
    
    // MARK: Navigation - prepare() function!
    // ----------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("going to next page")
    }
}

