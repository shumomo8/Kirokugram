//
//  KirokuViewController.swift
//  Kirokugram
//
//  Created by Shu Fujita on 2020/06/04.
//  Copyright © 2020 Fujita shu. All rights reserved.
//

import UIKit
import RealmSwift


class KirokuViewController: UIViewController,UIPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    //写真表示
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBAction func onTappedCameraButton() {
            presentPickerController(sourceType: .camera)
         }
    @IBAction func onTappedAlbumButton() {
            presentPickerController(sourceType: .photoLibrary)
         }
       //カメラ、アルバムの呼び出し
    func presentPickerController(sourceType: UIImagePickerController.SourceType){
           if UIImagePickerController.isSourceTypeAvailable(sourceType){
               //カメラの起動
               let picker = UIImagePickerController()
               picker.sourceType = sourceType
               picker.delegate = self
               self.present(picker,animated: true,completion: nil)
               }
       }
       //写真選択時に呼ばれる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           //画像出力
           photoImageView.image = info[.originalImage]as? UIImage
           self.dismiss(animated: true, completion: nil)
          
       }
    
    //詳細記録
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var placeTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var memoTextView: UITextView!
    @IBOutlet var categoryPickerView: UIPickerView!
 


    let realm = try! Realm()
    
       override func viewDidLoad() {
           super.viewDidLoad()

           // Delegate設定
            categoryPickerView.delegate = self
            categoryPickerView.dataSource = self
             }
             
             // UIPickerViewの列の数
             func numberOfComponents(in categoryPickerView: UIPickerView) -> Int {
                 return 1
             }
             
             // UIPickerViewの行数、リストの数
             func categoryPickerView(_ categoryPickerView: UIPickerView,
                             numberOfRowsInComponent component: Int) -> Int {
                 return dataList.count
             }
             // UIPickerViewの最初の表示
             func categoryPickerView(_ categoryPickerView: UIPickerView,
                             titleForRow row: Int,
                             forComponent component: Int) -> String? {
                 return dataList[row]
             }
             // UIPickerViewのRowが選択された時の挙動
             func categoryPickerView(_ categoryPickerView: UIPickerView,
                             didSelectRow row: Int,
                             inComponent component: Int) {
                 
                 label.text = dataList[row]
             }
       
    //保存・キャンセル等
    @IBAction func addRecord() {
        let newRecord = Record()
        newRecord.name = nameTextField.text!
        newRecord.place = placeTextField.text!
        newRecord.date = Int(dateTextField.text!)!
        newRecord.url = urlTextField.text!
        newRecord.memo = memoTextView.text!
        newRecord.category = categoryPickerView.
        
        try! realm.write {
            realm.add(newRecord)
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancel() {
            dismiss(animated: true, completion: nil)
        }
      
    
    
    @IBAction func onTappedSaveButton(){
        if photoImageView.image != nil {
            let activityVC = UIActivityViewController(activityItems: [photoImageView.image!,""], applicationActivities: nil)
            self.present(activityVC,animated: true,completion: nil)
        }else{
            print("画像がありません")
        }
    }
    }
    

   
    
