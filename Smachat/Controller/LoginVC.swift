//
//  loginVC.swift
//  Smachat
//
//  Created by Wissa Azmy on 3/1/18.
//  Copyright © 2018 Wissa Azmy. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signupBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_SIGNUP, sender: nil)
    }
}
