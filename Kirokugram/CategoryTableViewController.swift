//
//  CategoryTableViewController.swift
//  Kirokugram
//
//  Created by Shu Fujita on 2020/06/06.
//  Copyright © 2020 Fujita shu. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var categoryArray: [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
          tableView.rowHeight = 70
        
    }
    
      override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(true)
             if saveData.array(forKey: "category") != nil {
                 categoryArray = saveData.array(forKey: "category") as! [Dictionary<String,String>]
             }
             
             tableView.reloadData()
             
         }
    // MARK: - Table view data source
    //セクション数を指定
     override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //セルの個数を指定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryArray.count
    }
    //セルの中身の個数を指定
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell

          let nowIndexPathCategory = categoryArray[indexPath.row]
          
          cell.categoryLabel.text = nowIndexPathCategory["category"]

          return cell
      }

    

}
