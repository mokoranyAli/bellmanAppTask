//
//  HomeTableView + Delegates.swift
//  BellmanAppTask
//
//  Created by Mohamed Korany Ali on 1/26/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import Foundation
import UIKit

extension homeViewController :  UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter!.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
                               as! homeTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.titleOfSectionLabel.text = "Hotspots"
        case 1:
            cell.titleOfSectionLabel.text = "Events"
            cell.iconOfSection.image = UIImage(named: "events_icon")
        case 2:
            cell.titleOfSectionLabel.text = "Attractions"
            cell.iconOfSection.image = UIImage(named: "attarctions_icon")
        default: break
            
        }
        
        presenter?.configure(cell: cell, indexPath: indexPath)
        
               return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 350
       }
    
    
    
}

