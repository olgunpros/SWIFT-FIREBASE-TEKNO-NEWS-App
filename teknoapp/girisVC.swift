//
//  girisVC.swift
//  teknoapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 28.12.2023.
//

import UIKit
import Firebase

class girisVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signinClicked(_ sender: Any) {
        
        if(emailText.text != "" && passwordText.text != "") {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if(error != nil) {
                    
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }
                else {
                    self.performSegue(withIdentifier: "tobasariliVC", sender: nil)
                }
            }
        }
        else {
            self.makeAlert(titleInput: "Error", messageInput: "Email? / Password?")
        }
        
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "tosigninVC", sender: nil)
    }
    func makeAlert(titleInput: String, messageInput: String){
            
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
            
        }
    

}
