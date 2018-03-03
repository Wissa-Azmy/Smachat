//
//  Constants.swift
//  Smachat
//
//  Created by Wissa Azmy on 3/1/18.
//  Copyright © 2018 Wissa Azmy. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// Segues
let TO_LOGIN = "toLogin"
let TO_SIGNUP = "toSignup"
let UNWIND = "unwinedToChannel"

//URLs
let BASE_URL = "https://chattychatjb.herokuapp.com/v1/"
let REGISTER_URL = "\(BASE_URL)account/register"
