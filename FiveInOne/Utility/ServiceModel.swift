//
//  ServiceModel.swift
//  FiveInOne
//
//  Created by Admin on 12/01/18.
//  Copyright © 2018 Charan Raj. All rights reserved.
//

import UIKit

class ServiceModel: NSObject {
    
    let ipAddress = "http://132.148.141.37:8080/FingTip"
    

    func login(username: String, password: String, completion: @escaping ([String:Any]) -> Void) {
        var dict = [String: Any]()
        let json: [String: Any] = ["phno":"1234567890",
                                   "password":"manju123"]
        
        let jsondata = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        
        let url = URL(string: "\(ipAddress)/userlogin")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbjk4NyIsImV4cCI6MTUxNzYzNjMwNH0.7xWXsiMRwtXYYZzSOxFMBD02uXIesGmNypGPtfNMXi9y0sBGoZRtlJ06Kya5k-sonCvcBIsTokKDtvN_u3TFYQ",
                         forHTTPHeaderField: "Authorization")
        request.httpBody = jsondata
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
        print(error?.localizedDescription ?? "No data")
        return 
        }
        let responseObjJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseObjJSON as? [String: Any] {
                dict = responseJSON
                completion(dict)
            }
        }
        task.resume()
        //return dict

    }

    func signup(username: String, email: String, mobile: String, password: String, aadhar: String, address: String, pincode: String, completion: @escaping ([String:Any]) -> Void) {
        var dict = [String: Any]()
      /*let json: [String: Any] = ["name": username,
                                 "password": password,
                                 "adharno": aadhar,
                                 "emailid": email,
                                 "phno": mobile,
                                 "place": address,
                                 "zipcode": pincode]*/
        
        let json: [String: Any] = ["name": "Charan",
                                   "password": "password",
                                   "adharno": "12345678953",
                                   "emailid": "email@gmail.com",
                                   "phno": "9620351043",
                                   "place": "address",
                                   "zipcode": "560068"]
        
        let jsondata = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        
        let url = URL(string: "\(ipAddress)/registration")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbjk4NyIsImV4cCI6MTUxNzYzNjMwNH0.7xWXsiMRwtXYYZzSOxFMBD02uXIesGmNypGPtfNMXi9y0sBGoZRtlJ06Kya5k-sonCvcBIsTokKDtvN_u3TFYQ",
                         forHTTPHeaderField: "Authorization")
        request.httpBody = jsondata
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseObjJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseObjJSON as? [String: Any] {
                dict = responseJSON
                completion(dict)
            }
        }
        task.resume()
    }
    
    func mobileVerify(phone: String, completion: @escaping ([String:Any]) -> Void) {
        var dict = [String: Any]()
        
        let json: [String: Any] = ["phno":"8553699497"]
        let jsondata = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        
       
        let url = URL(string: "\(ipAddress)/mobileVerification")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbjk4NyIsImV4cCI6MTUxNzYzNjMwNH0.7xWXsiMRwtXYYZzSOxFMBD02uXIesGmNypGPtfNMXi9y0sBGoZRtlJ06Kya5k-sonCvcBIsTokKDtvN_u3TFYQ",
                         forHTTPHeaderField: "Authorization")
        request.httpBody = jsondata
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseObjJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseObjJSON as? [String: Any] {
                dict = responseJSON
                completion(dict)
            }
        }
         task.resume()
        
    }
   
}
