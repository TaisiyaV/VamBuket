//
//  NetworkService.swift
//  VamBuket
//
//  Created by tasya on 25.03.2021.
//  Copyright © 2021 Taisiya V. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    //"shop1@example.com"
    //"password"
    
    func authorization(login: String,
                       password: String,
                       onCompleted: @escaping () -> Void,
                       onError: @escaping (Error) -> Void) {
        
        guard let url = URL(string: "http://api.dev.buket-vam.ru/api/v1/login") else { return }
        let parameters = ["login": login, "password": password]
      
        AF.request(url, method: .post, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let jsonObject = value as? [String: Any] else { return }
                guard let jwt = jsonObject["jwt"] else { return }
//                print(jwt)
                let userDefaults = UserDefaults.standard
                userDefaults.set(jwt, forKey: "jwt")
                onCompleted()
            case .failure(let error):
                onError(error)
//                print(error)
            }
        }
    }
    
    
    func getUserData(onCompleted: @escaping (Attributes) -> Void,
                    onError: @escaping (Error) -> Void) {
        let userDefaultsGet = UserDefaults.standard
        guard let jwt = userDefaultsGet.string(forKey: "jwt") else { return }
//        print(jwt)
        let link = "http://api.dev.buket-vam.ru/api/v1/me"
        let header: HTTPHeaders = ["Authorization": jwt]
        AF.request(link, method: .get, headers: header).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                guard let jsonObject = value as? [String: Any] else { return }
                guard let data = jsonObject["data"] as? [String: Any] else { return }
                guard let attributes = data["attributes"] as? [String: Any] else { return }
                
                let user = Attributes(firstName: attributes["first_name"] as! String, lastName: attributes["last_name"] as! String, phohe: attributes["phone"] as! String, email: attributes["email"] as! String, role: attributes["role"] as! String)

                onCompleted(user)
//                print(user)
            case .failure(_):
//                print("unadable decode data")
                onError(NSError())
            }
        }
    
    }
    
}
