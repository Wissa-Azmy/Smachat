//
//  ChannelVC.swift
//  Smachat
//
//  Created by Wissa Azmy on 2/28/18.
//  Copyright © 2018 Wissa Azmy. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    // Outlets
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    

    

}
