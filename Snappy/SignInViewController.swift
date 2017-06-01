//
//  SignInViewController.swift
//  Snappy
//
//  Created by Zeean Veljee on 31/05/17.
//  Copyright © 2017 Zed. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func turnUpTapped(_ sender: Any) {
        
    FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
        print("Tried to log in")
        if error != nil {
            print("Error while logging in: \(error)")
            
            FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                print("Tried to create a new user")
                
                if error != nil {
                    print("Error while creating a user: \(error)")
                }
                else {
                    print("Yaaay user created")
                    self.performSegue(withIdentifier: "signInSegue", sender: nil)
                }
            })
        } else {
            print("Yaaaay logged in")
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
        }
    })
    }

}

