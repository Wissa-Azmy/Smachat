//
//  ChannelVC.swift
//  Smachat
//
//  Created by Wissa Azmy on 2/28/18.
//  Copyright © 2018 Wissa Azmy. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    

}
