//
//  AddCategoryViewController.swift
//  Kirokugram
//
//  Created by Shu Fujita on 2020/06/06.
//  Copyright © 2020 Fujita shu. All rights reserved.
//

import UIKit

class AddCategoryViewController: UIViewController {
    
    @IBOutlet var categoryTextField: UITextField!
       
       var categoryArray: [Dictionary<String, String>] = []
       let saveDate = UserDefaults.standard
       
       @IBAction func saveWord(){
           let categoryList = ["category": categoryTextField.text!]
                         
           categoryArray.append(categoryList)
           saveDate.set(categoryArray, forKey: "category")
           
           let alart = UIAlertController(
               title: "追加完了",
               message: "カテゴリの登録が完了しました",
               preferredStyle: .alert
           )
           alart.addAction(UIAlertAction(
               title: "OK",
               style: .default,
               handler: nil
           ))
           present(alart, animated: true, completion: nil)
           categoryTextField.text = ""
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveDate.array(forKey: "WORD") != nil {
                   categoryArray = saveDate.array(forKey: "WORD") as! [Dictionary<String, String>]
                   
              
               }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
