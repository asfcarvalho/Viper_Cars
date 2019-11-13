//
//  ModelCell.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

class ModelCell: UITableViewCell {
    
    let valueLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configCell() {
        self.addSubview(valueLabel)
        
        setupAnchors()
    }
    
    private func setupAnchors() {
        valueLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, centerY: nil, padding: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        
    }
    
    func setupCell(_ wkda: Wkda?, _ row: Int) {
        
        valueLabel.text = wkda?.value
        
        self.backgroundColor = row % 2 == 0 ? UIColor.white : UIColor.blue.withAlphaComponent(0.3)
    }

}
