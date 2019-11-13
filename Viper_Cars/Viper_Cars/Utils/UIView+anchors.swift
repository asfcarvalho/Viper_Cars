//
//  UIView+anchors.swift
//  Viper_Cars
//
//  Created by Anderson F Carvalho on 12/11/2019.
//  Copyright © 2019 Anderson F Carvalho. All rights reserved.
//

import UIKit

enum AnchorMethod {
    case equalTo,
    greaterThanOrEqualTo,
    lessThanOrEqualTo
}

extension UIView {
    
    func fillSuperview(padding: UIEdgeInsets) {
        anchor(top: superview?.safeAreaLayoutGuide.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.safeAreaLayoutGuide.bottomAnchor, trailing: superview?.trailingAnchor, centerX: nil, centerY: nil, padding: padding)
    }
    
    func fillSuperview() {
        fillSuperview(padding: .zero)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, topMethod: AnchorMethod = AnchorMethod.equalTo, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            if topMethod == AnchorMethod.equalTo {
                topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
            }else if topMethod == AnchorMethod.greaterThanOrEqualTo {
                topAnchor.constraint(greaterThanOrEqualTo: top, constant: padding.top).isActive = true
            }else {
                topAnchor.constraint(lessThanOrEqualTo: top, constant: padding.top).isActive = true
            }
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: padding.left).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: padding.top).isActive = true
        }
        
        anchorSize(size)
        
    }
    
    func anchorSize(_ size: CGSize) {
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func aspectRatio(_ widthRatio: CGFloat?, _ heightRatio: CGFloat?) {
        if let widthRatio = widthRatio {
            widthAnchor.constraint(equalTo: superview?.widthAnchor ?? widthAnchor, multiplier: widthRatio).isActive = true
        }
        
        if let heightRatio = heightRatio {
            heightAnchor.constraint(equalTo: superview?.heightAnchor ?? heightAnchor, multiplier: heightRatio).isActive = true
        }
    }
}



