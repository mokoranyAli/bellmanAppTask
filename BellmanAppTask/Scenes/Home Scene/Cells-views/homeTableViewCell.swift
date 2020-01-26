//
//  homeTableViewCell.swift
//  BellmanAppTask
//
//  Created by Mohamed Korany Ali on 1/26/20.
//  Copyright © 2020 Mohamed Korany Ali. All rights reserved.
//

import UIKit
import SDWebImage

class homeTableViewCell: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource
, UICollectionViewDelegateFlowLayout , HomeTableCellView{
    func reloadData() {
          self.collectionView.reloadData()
    }
    
    
    var itemsInSection:[Item] = [Item]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var titleOfSectionLabel: UILabel!
    @IBOutlet weak var iconOfSection: UIImageView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch itemsInSection.count {
               case 0:
                   return 5
               default:
                   return itemsInSection.count
               }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewcell", for: indexPath as IndexPath) as! HomeCollectionViewCell
         
        
         if itemsInSection.count > 0{
             cell.titleCell.text = itemsInSection[indexPath.row].category
                    cell.typeCell.text = itemsInSection[indexPath.row].category
            
            print("ss")
                   
                    let range = itemsInSection[indexPath.row].photos.count
                    print(range)
                    if range > 0{
                        
                        let randomInt = Int.random(in: 0..<range)
                               let imageUrl :String = itemsInSection[indexPath.row].photos[randomInt]
                        
                               cell.imageViewCell.sd_setImage(with: URL(string: imageUrl) , completed: nil)
                        
                        print("done")
                    }
                    

         }
        
         
         return cell
    }
    
    func configure(placeDTO: [Item]) {
        itemsInSection = placeDTO
        print(itemsInSection.count)
        self.collectionView.reloadData()
    }
//
//    func reloadCollectionView() -> Void {
//
//         self.collectionView.reloadData()
//    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCollectionView(){
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    let size = CGSize(width: 170 , height: 182)
      
    return size
    }

}
