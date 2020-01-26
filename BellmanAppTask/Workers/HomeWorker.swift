//
//  HomeWorker.swift
//  BellmanAppTask
//
//  Created by Mohamed Korany Ali on 1/26/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import Foundation


class HomeWorker {
    
    private let networkLayer = NetworkManger.shared
    
    func getPlaces(completionHandler: @escaping ([[Item]]?) -> ()) {
        networkLayer.placeList(completionHandler: completionHandler)
       }

    
}
