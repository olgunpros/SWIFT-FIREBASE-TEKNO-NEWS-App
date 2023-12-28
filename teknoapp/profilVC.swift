//
//  profilVC.swift
//  teknoapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 28.12.2023.
//

import UIKit

class profilVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "tologinVC", sender: nil)
    }
    
   
}
