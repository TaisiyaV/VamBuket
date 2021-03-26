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
    
    
    func authorization() {
        
        guard let url = URL(string: "http://api.dev.buket-vam.ru/api/v1/login") else { return }
        
        let parameters = ["login": "shop1@example.com", "password": "password"]
      
        AF.request(url, method: .post, parameters: parameters).validate().responseJSON { response in


            switch response.result {
            case .success(let value):
                guard let jsonObject = value as? [String: Any] else { return }
                guard let jwt = jsonObject["jwt"] else { return }
                print(jwt)
                let userDefaults = UserDefaults.standard
                userDefaults.set(jwt, forKey: "jwt")

            case .failure(let error):
                    print(error)
            }
              
        }
        

   
    }
    
    
    func getUserData() {
        let userDefaultsGet = UserDefaults.standard
        guard let jwt = userDefaultsGet.string(forKey: "jwt") else { return }
        print(jwt)
        
        
        let link = "http://api.dev.buket-vam.ru/api/v1/me"
        let header: HTTPHeaders = ["Authorization": jwt]
        AF.request(link, method: .get, headers: header).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                guard let jsonObject = value as? [String: Any] else { return }
                
                print(jsonObject)
                
            case .failure(_):
                print("unadable decode data")
                
                return
            }
        }
       
        
    }
    
    
//    func getBag(onCompleted: @escaping ([BagCatalog]) -> Void,
//                onError: @escaping (Error) -> Void) {
//
//        AF.request(link, method: .get).validate().responseJSON { response in
//
//            switch response.result {
//            case .success(let value):
//                for item in value as! [[String: AnyObject]] {
//                    let bagsData = BagCatalog(title: item["title"] as! String, url: item["url"] as! String)
//                    self.dataArray.append(bagsData)
//                }
//                onCompleted(self.dataArray)
//            case .failure(_):
//                print("unadable decode data")
//                onError(NSError())
//                return
//            }
//        }
//    }
    
}
