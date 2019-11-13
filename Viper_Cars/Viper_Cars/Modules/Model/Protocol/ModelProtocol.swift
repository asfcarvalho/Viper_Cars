//
//  ModelProtocol.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

protocol ModelViewProtocol {
    var viewController: ModelVCProtocol? { get set }
    
    func showModel()
}

protocol ModelVCProtocol {
    var modelView: ModelView? { get set }
    var presenter: ModelPresenterProtocol? { get set }
    
    func showLoading()
    func stopLoading()
    func showMessage(_ indexPath: IndexPath)
    func showModel()
    func getModelCount() -> Int
    func getModel(_ indexPath: IndexPath) -> Wkda?
    func callNewPage(_ indexPath: IndexPath)
}

protocol ModelPresenterProtocol {
    var viewController: ModelVCProtocol? { get set }
    var wireFrame: ModelWireFrameProtocol? { get set }
    var dataModule: ModelDataModuleInputProtocol? { get set }
    
    func viewDidLoad(_ input: Wkda?)
    func fetchData()
    func callNewPage(_ indexPath: IndexPath)
    func showMessage(_ indexPath: IndexPath)
    func getModelCount() -> Int
    func getModel(_ indexPath: IndexPath) -> Wkda?
}

protocol ModelWireFrameProtocol {
    static func creteViewController(_ input: Wkda?) -> UIViewController
    
    func showAlert(from viewController: ModelVCProtocol?, title: String, message: String)
}

protocol ModelDataModuleInputProtocol {
    var presenter: ModelDataModuleOutputProtocol? { get set }
    
    func modelFetch(_ id: String, _ page: Int)
}

protocol ModelDataModuleOutputProtocol: class {
    func onError(_ error: String)
    func onSuccess(_ model: Model)
}
