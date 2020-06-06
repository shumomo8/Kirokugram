//
//  HomeViewController.swift
//  Kirokugram
//
//  Created by Shu Fujita on 2020/06/04.
//  Copyright © 2020 Fujita shu. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    let realm = try! Realm()
    let record = try! Realm().objects(Record.self)
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        notificationToken = record.observe { [weak self] _ in
            self?.collectionView.reloadData()

        }
    }
     func collectionView(_ collectionView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return record.count
    }
    
    func collectionView(_ tableView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(performSegue(withIdentifier: "Cell", for: IndexPath)) as!HomeCollectionViewCell
    cell.nameLabel.text = record [indexPath.row].name
    cell.placeLabel.text = record [indexPath.row].place
    cell.dateLabel.text = String(record [indexPath.row].date)
    cell.urlLabel.text = record [indexPath.raw].name
    cell.memoLabel.text = record [indexPath.raw].memo
    return cell





}
}
