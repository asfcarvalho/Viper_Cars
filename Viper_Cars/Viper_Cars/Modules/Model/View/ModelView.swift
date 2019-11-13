//
//  ModelView.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

class ModelView: UIView {
    
    let cellName = "cell"
    
    var viewController: ModelVCProtocol?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        
        tableView.register(ModelCell.self, forCellReuseIdentifier: cellName)
        tableView.dataSource = self
        tableView.delegate = self
        
        self.addSubview(tableView)
        
        setupAnchors()
    }
    
    private func setupAnchors() {
        tableView.fillSuperview()
    }
}

extension ModelView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController?.getModelCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? ModelCell else {
            return UITableViewCell()
        }
        
        cell.awakeFromNib()
        cell.setupCell(viewController?.getModel(indexPath), indexPath.row)

        viewController?.callNewPage(indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
        viewController?.showMessage(indexPath)
    }
}

extension ModelView: ModelViewProtocol {
    func showModel() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
