//
//  homeViewController.swift
//  BellmanAppTask
//
//  Created Mohamed Korany Ali on 1/26/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import CircleMenu

class homeViewController: UIViewController {
   
    @IBOutlet weak var searchBarItem: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var myTabbar: CustomizedTabBar!
    @IBOutlet weak var homeTabBarItem: UITabBarItem!
    let itemsForRounderButton: [(icon: String, color: UIColor)] = [
        ("attarctions_icon", UIColor(red: 0.19, green: 0.57, blue: 1, alpha: 1)),
        ("events_icon", UIColor(red: 0.22, green: 0.74, blue: 0, alpha: 1)),
        ("location_white", UIColor(red: 0.96, green: 0.23, blue: 0.21, alpha: 1)),
        ("hotspot_icon", UIColor(red: 0.51, green: 0.15, blue: 1, alpha: 1))
        
    ]
    
    @IBOutlet weak var bellmanButton: CircleMenu!
    var presenter: homePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidload()
        bellmanButton.delegate = self
        setupSearchBarView()
        myTabbar.selectedItem = homeTabBarItem
        
    }
    
    var isRoundButtonPressed = false
    
    @IBAction func bellmanButtonDidPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            
            if self.tableView.alpha == 1{
            self.bellmanButton.transform = self.bellmanButton.transform.rotated(by: CGFloat.pi)
            self.bellmanButton.transform = self.bellmanButton.transform.rotated(by: CGFloat.pi)
                self.tableView.alpha = 0.1
                
                
            }
            else {
                self.tableView.alpha = 1
            }
        }
    }
    
    
    
}
