//
//  ManufacturerDataModule.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import Foundation

class ManufacturerDataModule: ManufacturerDataModuleInputProtocol {
    
    weak var presenter: ManufacturerDataModuleOutputProtocol?
    
    let pageSize = 15
    
    func manufacturerFetch(_ page: Int) {
        
        let apiRequest = APIRequest()
        apiRequest.baseURL = URL(string: "\(URLDdefault)manufacturer?page=\(page)&pageSize=\(pageSize)&wa_key=\(keyDefault)")
        
        APICalling().fetch(apiRequest: apiRequest) { [weak self] (result: Manufacturer?, error) in
            if let result = result, error == nil {
                self?.presenter?.onSuccess(result)
            }else {
                self?.presenter?.onError(error ?? "Error")
            }
        }
        
    }
}
