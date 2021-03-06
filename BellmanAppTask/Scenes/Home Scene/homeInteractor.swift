//
//  homeInteractor.swift
//  BellmanAppTask
//
//  Created Mohamed Korany Ali on 1/26/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class homeInteractor: homeInteractorInputProtocol {
    private let homeWorker = HomeWorker()
    func getPlaces() {
        
        homeWorker.getPlaces { [weak self] items in
                   guard let self = self else { return }
            
            if let itemss = items {
                
                self.presenter?.placesFetchedSuccessfully(places: itemss)
            }
            else {
                self.presenter?.placesFetchingFailed()
            }
        
    }
    
   
    }
    

    weak var presenter: homeInteractorOutputProtocol?
}
