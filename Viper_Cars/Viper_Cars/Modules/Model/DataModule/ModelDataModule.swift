//
//  ModelDataModule.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

class ModelDataModule: ModelDataModuleInputProtocol {
    
    
    weak var presenter: ModelDataModuleOutputProtocol?
    
    let pageSize = 15
    
    func modelFetch(_ id: String, _ page: Int) {
        let apiRequest = APIRequest()
        apiRequest.baseURL = URL(string: "\(URLDdefault)main-types?manufacturer=\(id)&page=\(page)&pageSize=\(pageSize)&wa_key=\(keyDefault)")
        
        APICalling().fetch(apiRequest: apiRequest) { [weak self] (result: Model?, error) in
            if let result = result, error == nil {
                self?.presenter?.onSuccess(result)
            }else {
                self?.presenter?.onError(error ?? "Error")
            }
        }
    }
    
    
}
