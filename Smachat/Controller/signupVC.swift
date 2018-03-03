//
//  signupVC.swift
//  Smachat
//
//  Created by Wissa Azmy on 3/1/18.
//  Copyright © 2018 Wissa Azmy. All rights reserved.
//

import UIKit

class signupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
