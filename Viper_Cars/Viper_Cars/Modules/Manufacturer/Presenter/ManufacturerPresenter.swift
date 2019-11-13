//
//  ManufacturerPresenter.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import Foundation

class ManufacturerPresenter: ManufacturerPresenterProtocol {
    var viewController: ManufacturerVCProtocol?
    var wireFrame: ManufacturerWireFrameProtocol?
    var dataModule: ManufacturerDataModuleInputProtocol?
    
    var wkdaList: [Wkda]?
    var page = 0
    var totalPageCount = 0
    
    func viewDidLoad() {
        fetchData()
    }
    
    func showModel(_ indexPath: IndexPath) {
        wireFrame?.showModel(from: viewController, wkda: wkdaList?[indexPath.row])
    }
    
    func getManufacturerCount() -> Int {
        return wkdaList?.count ?? 0
    }
    
    func getManufacturer(_ indexPath: IndexPath) -> Wkda? {
        let wkda = wkdaList?[indexPath.row]
        return Wkda(code: wkda?.key, name: wkda?.value, key: wkda?.key, value: wkda?.value)
    }
    
    func fetchData() {
        viewController?.showLoading()
        
        dataModule?.manufacturerFetch(self.page)
    }
    
    func callNewPage(_ indexPath: IndexPath) {
        if indexPath.row == (self.getManufacturerCount() - 1) && (self.page) < (self.totalPageCount) {
            fetchData()
        }
    }
}

extension ManufacturerPresenter: ManufacturerDataModuleOutputProtocol {
    func onError(_ error: String) {
        viewController?.stopLoading()
        wireFrame?.showAlert(from: viewController, message: error)
    }
    
    func onSuccess(_ manufacturer: Manufacturer) {
        
        self.page = (manufacturer.page ?? 0) + 1
        self.totalPageCount = manufacturer.totalPageCount ?? 0
        let temp = manufacturer.wkda?.map({ (key, value) -> Wkda in
            return Wkda(code: key, name: value, key: "Code: \(key)", value: "Name: \(value)")
        })
        
        if self.wkdaList == nil {
            self.wkdaList = temp
        }else {
            self.wkdaList?.append(contentsOf: temp ?? [])
        }
        
        viewController?.showManufacturer()
        viewController?.stopLoading()
    }
    
    
}
