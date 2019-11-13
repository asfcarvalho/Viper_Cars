//
//  APICalling.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import Foundation

class APICalling {
    
    func fetch<T: Codable>(apiRequest: APIRequest, callBack: @escaping (T?, String?) -> Void) {
        
        let request = apiRequest.request(with: apiRequest.baseURL)
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                callBack(nil, error?.localizedDescription)
                return
                
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                callBack(model, nil)
                
            } catch let error {
                callBack(nil, error.localizedDescription)
            }
            
        }
        task.resume()
        
    }
}
