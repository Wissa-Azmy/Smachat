//
//  AuthService.swift
//  Smachat
//
//  Created by Wissa Azmy on 3/3/18.
//  Copyright © 2018 Wissa Azmy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    static let instance = AuthService()
    
    var email: String {
        get{
            return UserDefaults.standard.string(forKey: "userEmail")!
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "userEmail")
        }
    }
    
    var authToken: String {
        get{
            return UserDefaults.standard.string(forKey: "token")!
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
    
    var isLoggedIn: Bool {
        get{
            return UserDefaults.standard.bool(forKey: "loggedIn")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "loggedIn")
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let header = [
            "Content-Type": "application/json"
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        Alamofire.request(REGISTER_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil{
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
}
