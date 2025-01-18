//
//  AppDelegate.swift
//  ChatGroup
//
//  Created by Igor Pinheiro Ribeiro on 17/01/25.
//


import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email  = emailTextfield.text,let password = emailTextfield.text{
            // checar documentação para mais detalhes de lifecycle
            Auth.auth().signIn(withEmail: email, password: password) {   authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                }else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
       
    }
    
}
