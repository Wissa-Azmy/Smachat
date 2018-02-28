//
//  ChatVC.swift
//  Smachat
//
//  Created by Wissa Azmy on 2/28/18.
//  Copyright © 2018 Wissa Azmy. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var menuBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        // Swipe right and left to show and hide side menu
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Tap to hide the menu
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }

    
   

}
