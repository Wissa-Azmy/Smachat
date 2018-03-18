//
//  RegisterVC.swift
//  Smachat
//
//  Created by Wissa Azmy on 3/3/18.
//  Copyright © 2018 Wissa Azmy. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickAvatarPressed(_ sender: UIButton){
        
    }
    
    @IBAction func pickBGColorPressed(_ sender: UIButton){
        
    }
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        guard let name = usernameTxt.text, usernameTxt.text != "" else {return}
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let password = passwordTxt.text, passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success{
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        print("User registered successfully.", AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarName: "profileDefault", avatarColor: "[0.5, 0.5, 0.5, 1]", completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
                
            }
        }
    }
    
    
}
