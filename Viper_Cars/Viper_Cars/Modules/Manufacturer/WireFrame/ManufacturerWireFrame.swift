//
//  ManufacturerWireFrame.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 12/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

class ManufacturerWireFrame: ManufacturerWireFrameProtocol {
    
    class func creteViewController() -> UIViewController {
        
        var presenter: ManufacturerPresenterProtocol & ManufacturerDataModuleOutputProtocol = ManufacturerPresenter()
        let wireFrame: ManufacturerWireFrameProtocol = ManufacturerWireFrame()
        var dataModule: ManufacturerDataModuleInputProtocol = ManufacturerDataModule()
        
        let viewController = ManufacturerVC.init(nibName: nil, bundle: nil)
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.wireFrame = wireFrame
        presenter.dataModule = dataModule
        dataModule.presenter = presenter
        
        return viewController
    }
    
    func showAlert(from viewController: ManufacturerVCProtocol?, message: String) {
        DispatchQueue.main.async {
            UIAlertCustom.shared.showAlert(from: viewController as? UIViewController, message: message, prefferedStyle: UIAlertController.Style.alert)
        }
    }
    
    func showModel(from viewController: ManufacturerVCProtocol?, wkda: Wkda?) {
        DispatchQueue.main.async {
            if let viewController = viewController as? UIViewController {
                let model = ModelWireFrame.creteViewController(wkda)
                viewController.navigationController?.pushViewController(model, animated: true)
            }
        }
    }
    
    
}
