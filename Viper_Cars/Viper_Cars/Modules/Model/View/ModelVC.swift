//
//  ModelVC.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

class ModelVC: UIViewController {
    
    var modelView: ModelView?
    var presenter: ModelPresenterProtocol?
    var input: Wkda?

    override func viewDidLoad() {
        super.viewDidLoad()

        modelView = ModelView(frame: self.view.frame)
        modelView?.viewController = self
        
        self.view = modelView
        
        presenter?.viewDidLoad(input)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Model"
    }
}

extension ModelVC: ModelVCProtocol {
    
    func showLoading() {
        Loading.shared.showLoading(self.view)
    }
    
    func stopLoading() {
        Loading.shared.stopLoading()
    }
    
    func showMessage(_ indexPath: IndexPath) {
        presenter?.showMessage(indexPath)
    }
    
    func showModel() {
        modelView?.showModel()
    }
    
    func getModelCount() -> Int {
        return presenter?.getModelCount() ?? 0
    }
    
    func getModel(_ indexPath: IndexPath) -> Wkda? {
        return presenter?.getModel(indexPath)
    }
    
    func callNewPage(_ indexPath: IndexPath) {
        presenter?.callNewPage(indexPath)
    }
    
    
}
