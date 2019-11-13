//
//  ModelWireFrame.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

class ModelWireFrame: ModelWireFrameProtocol {
    class func creteViewController(_ input: Wkda?) -> UIViewController {
        
        var presenter: ModelPresenterProtocol & ModelDataModuleOutputProtocol = ModelPresenter()
        let wireFrame: ModelWireFrameProtocol = ModelWireFrame()
        var dataModule: ModelDataModuleInputProtocol = ModelDataModule()
        
        let viewController = ModelVC.init(nibName: nil, bundle: nil)
        viewController.input = input
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.wireFrame = wireFrame
        presenter.dataModule = dataModule
        dataModule.presenter = presenter
        
        return viewController
    }
    
    func showAlert(from viewController: ModelVCProtocol?, title: String, message: String) {
        DispatchQueue.main.async {
            UIAlertCustom.shared.showAlert(from: viewController as? UIViewController, title: title, message: message, prefferedStyle: UIAlertController.Style.alert)
        }
    }
    
    
}
