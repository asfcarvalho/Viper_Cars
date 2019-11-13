//
//  ManufacturerProtocol.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 12/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

protocol ManufacturerViewProtocol {
    var viewController: ManufacturerVCProtocol? { get set }
    
    func showManufacturer()
}

protocol ManufacturerVCProtocol {
    var manufacturerView: ManufacturerView? { get set }
    var presenter: ManufacturerPresenterProtocol? { get set }
    
    func showLoading()
    func stopLoading()
    func showManufacturer()
    func showModel(_ indexPath: IndexPath)
    func getManufacturerCount() -> Int
    func getManufacturer(_ indexPath: IndexPath) -> Wkda?
    func callNewPage(_ indexPath: IndexPath)
}

protocol ManufacturerPresenterProtocol {
    var viewController: ManufacturerVCProtocol? { get set }
    var wireFrame: ManufacturerWireFrameProtocol? { get set }
    var dataModule: ManufacturerDataModuleInputProtocol? { get set }
    
    func viewDidLoad()
    func fetchData()
    func callNewPage(_ indexPath: IndexPath)
    func showModel(_ indexPath: IndexPath)
    func getManufacturerCount() -> Int
    func getManufacturer(_ indexPath: IndexPath) -> Wkda?
}

protocol ManufacturerWireFrameProtocol {
    static func creteViewController() -> UIViewController
    
    func showAlert(from viewController: ManufacturerVCProtocol?, message: String)
    
    func showModel(from viewController: ManufacturerVCProtocol?, wkda: Wkda?)
}

protocol ManufacturerDataModuleInputProtocol {
    var presenter: ManufacturerDataModuleOutputProtocol? { get set }
    
    
    func manufacturerFetch(_ page: Int)
}

protocol ManufacturerDataModuleOutputProtocol: class {
    func onError(_ error: String)
    func onSuccess(_ manufacturer: Manufacturer)
}
