//
//  HomeVC + RoundBtn.swift
//  BellmanAppTask
//
//  Created by Mohamed Korany Ali on 1/26/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import Foundation
import UIKit
import CircleMenu
extension homeViewController : CircleMenuDelegate{
    
    
    func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = itemsForRounderButton[atIndex].color

        button.setImage(UIImage(named: itemsForRounderButton[atIndex].icon), for: .normal)

        // set highlited image
        let highlightedImage = UIImage(named: itemsForRounderButton[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }

    func circleMenu(_: CircleMenu, buttonWillSelected _: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }

    func circleMenu(_: CircleMenu, buttonDidSelected _: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
    }
    
    
}
