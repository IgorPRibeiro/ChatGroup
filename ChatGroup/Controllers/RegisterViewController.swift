//
//  AppDelegate.swift
//  ChatGroup
//
//  Created by Igor Pinheiro Ribeiro on 17/01/25.
//

import UIKit
import FirebaseAuth
import Foundation

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = emailTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password ) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                }else {
                    // sender -> origem da navegação
                    let defaults = UserDefaults.standard
                    defaults.set(
                        email,
                        forKey: K.keyEmail
                    )

                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
                
            }
        }
        
    }
    
}
