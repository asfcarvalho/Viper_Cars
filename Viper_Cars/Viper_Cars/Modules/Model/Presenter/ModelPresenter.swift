//
//  ModelPresenter.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

class ModelPresenter: ModelPresenterProtocol {
    var viewController: ModelVCProtocol?
    var wireFrame: ModelWireFrameProtocol?
    var dataModule: ModelDataModuleInputProtocol?
    var page = 0
    var totalPageCount = 0
    var wkdaList: [Wkda]?
    var inputWkda: Wkda?
    
    func viewDidLoad(_ input: Wkda?) {
        self.inputWkda = input
        fetchData()
    }
    
    func fetchData() {
        viewController?.showLoading()
        
        dataModule?.modelFetch(inputWkda?.code ?? "", page)
    }
    
    func callNewPage(_ indexPath: IndexPath) {
        if indexPath.row == (self.getModelCount() - 1) && (self.page) < (self.totalPageCount) {
            fetchData()
        }
    }
    
    func showMessage(_ indexPath: IndexPath) {
        let temp = wkdaList?[indexPath.row]
        wireFrame?.showAlert(from: viewController, title: "(manufacturer, model)", message: "\(inputWkda?.name ?? ""), \(temp?.name ?? "")")
    }
    
    func getModelCount() -> Int {
        return wkdaList?.count ?? 0
    }
    
    func getModel(_ indexPath: IndexPath) -> Wkda? {
        return wkdaList?[indexPath.row]
    }
    
    
}


extension ModelPresenter: ModelDataModuleOutputProtocol {
    func onError(_ error: String) {
        viewController?.stopLoading()
        wireFrame?.showAlert(from: viewController, title: "Error", message: error)
    }
    
    func onSuccess(_ model: Model) {
        
        self.page = (model.page ?? 0) + 1
        self.totalPageCount = model.totalPageCount ?? 0
        
        let temp = model.wkda?.map({ (key, value) -> Wkda in
            return Wkda(code: key, name: value, key: "Code: \(key)", value: "Name: \(value)")
        })
        
        if self.wkdaList == nil {
            self.wkdaList = temp
        }else {
            self.wkdaList?.append(contentsOf: temp ?? [])
        }
        
        viewController?.showModel()
        viewController?.stopLoading()
    }
    
    
}
