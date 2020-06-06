//
//  HomeViewController.swift
//  Kirokugram
//
//  Created by Shu Fujita on 2020/06/06.
//  Copyright © 2020 Fujita shu. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class HomeViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource{

    
      let realm = try! Realm()
      let record = try! Realm().objects(Record.self)
      var notificationToken: NotificationToken?
      
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

     
    }
    
        
       
        let cell = collectionView.dequeueReusableCell(performSegue(withIdentifier: "Cell", for: IndexPath)) as!HomeCollectionViewCell
        cell.nameLabel.text = record [indexPath.row].name
        cell.placeLabel.text = record [indexPath.row].place
        cell.dateLabel.text = String(record [indexPath.row].date)
        cell.urlLabel.text = record [indexPath.raw].name
        cell.memoLabel.text = record [indexPath.raw].memo
        return cell



            

    }
    
