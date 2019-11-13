//
//  ManufacturerCell.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 13/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

class ManufacturerCell: UITableViewCell {
    
    let keyLabel = UILabel()
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
        self.addSubview(keyLabel)
        self.addSubview(valueLabel)
        
        setupAnchors()
    }
    
    private func setupAnchors() {
        keyLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: nil, centerY: nil, padding: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0))
        
        valueLabel.anchor(top: keyLabel.topAnchor, leading: keyLabel.trailingAnchor, bottom: keyLabel.bottomAnchor, trailing: self.trailingAnchor, centerX: nil, centerY: nil, padding: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 16), size: CGSize(width: self.frame.width * 0.66, height: 0))
    }
    
    func setupCell(_ wkda: Wkda?, _ row: Int) {
        
        keyLabel.text = wkda?.key
        valueLabel.text = wkda?.value
        
        self.backgroundColor = row % 2 == 0 ? UIColor.white : UIColor.blue.withAlphaComponent(0.3)
    }

}
