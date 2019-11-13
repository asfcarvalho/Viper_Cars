//
//  ManufacturerVC.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 12/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

class ManufacturerVC: UIViewController {
    
    var manufacturerView: ManufacturerView?
    var presenter: ManufacturerPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        manufacturerView = ManufacturerView(frame: self.view.frame)
        manufacturerView?.viewController = self
        self.view = manufacturerView
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Manufacturer"
        
    }

}

extension ManufacturerVC: ManufacturerVCProtocol {
    
    func showModel(_ indexPath: IndexPath) {
        presenter?.showModel(indexPath)
    }
    
    func callNewPage(_ indexPath: IndexPath) {
        presenter?.callNewPage(indexPath)
    }
    
    func showManufacturer() {
        manufacturerView?.showManufacturer()
    }
    
    func getManufacturerCount() -> Int {
        return presenter?.getManufacturerCount() ?? 0
    }
    
    func getManufacturer(_ indexPath: IndexPath) -> Wkda? {
        return presenter?.getManufacturer(indexPath)
    }
    
    func showLoading() {
        Loading.shared.showLoading(self.view)
    }
    
    func stopLoading() {
        Loading.shared.stopLoading()
    }
    
    
}
