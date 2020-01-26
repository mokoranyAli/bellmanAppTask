//
//  NetworkManger.swift
//  BellmanAppTask
//
//  Created by Mohamed Korany Ali on 1/26/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import Foundation


import Foundation
import Alamofire

class NetworkManger {
    
    
    static let shared = NetworkManger()
    
    
    
    let returnedValuesHeader:Array<String> = ["attractions","events","hot_spots"]
    
    private init(){}
    
    
    func placeList(completionHandler: @escaping ([[Item]]?)->Void) {
        
        
        
        var itemList : [[Item]] = [[Item]]()
        Alamofire.request(Constants.shared.itemsURL).responseJSON  {
            response in
            switch response.result {
            case .success:
                
                let sucessDataValue = response.result.value
                let returnedData = sucessDataValue as! Dictionary<String, Any>
                
                
                let code =  returnedData["status_code"]  as! Int
                
                if(code == 200)
                {
                    let data =  returnedData["data"] as! Dictionary<String, Any>
                    
                    
                    
                        
                    for index in 0...2{
                        
                        let returnedEvents = data[self.returnedValuesHeader[index]]as! [Dictionary<String, Any>]
                            
                        var itemArray = [Item]()
                        
                            for myItem in returnedEvents
                            {
                              
                                let item = Item()
                                item.id = (myItem["id"] as?  Int) ?? 0
                                item.name = (myItem["name"] as?  String) ?? "no name"
                                
                                item.description = (myItem["description"] as?  String) ?? "no descriprion"
                                item.photos = (myItem["photos"] as? [String]?) as! [String]
                                
                                let categorey = myItem["categories"] as! [Dictionary<String, Any>]
                                
                                if categorey.count > 0 {
                                    if let  c =  categorey[0]["name"] {
                                       item.category = c as! String
                                    }
                                    
                                }
                                
                                itemArray.append(item)
                               
                               // print(itemList?.count)
                            
                            
                            
                        }
                         itemList.append(itemArray)
                    }
                        
                    
                    
                }
                
                completionHandler(itemList)
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
