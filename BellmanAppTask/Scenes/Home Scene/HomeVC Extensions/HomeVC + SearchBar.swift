//
//  HomeVC + SearchBar.swift
//  BellmanAppTask
//
//  Created by Mohamed Korany Ali on 1/26/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import Foundation
import UIKit
extension homeViewController {
    
    func setupSearchBarView(){
        self.searchBarItem.showsBookmarkButton = true
        self.searchBarItem.setImage(UIImage(named: "filter_inside_search"), for: .bookmark, state: .normal)

    }
    
    
}
