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
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(REGISTER_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil{
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(LOGIN_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                // TRADITIONAL JSON PARSING
//                if let json = response.result.value as? Dictionary<String, Any>{
//                    if let email = json["user"] as? String {
//                        self.email = email
//                    }
//                    if let token = json["token"] as? String {
//                        self.authToken = token
//                    }
//                }
                
                // USING SwiftyJSON
                guard let data = response.data else {return}
                let userData = JSON(data)
                self.email = userData["user"].stringValue
                self.authToken = userData["token"].stringValue
                self.isLoggedIn = true
                
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "name": name,
            "avatarName": avatarName,
            "avatarColor": avatarColor,
        ]
        
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(ADD_USER_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                let userData = JSON(data)
                let id = userData["_id"].stringValue
                let name = userData["name"].stringValue
                let email = userData["email"].stringValue
                let avatarName = userData["avatarName"].stringValue
                let avatarColor = userData["avatarColor"].stringValue
                
                UserDataService.instance.setUserData(id: id, color: avatarColor, avatarName: avatarName, email: email, name: name)
                
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
