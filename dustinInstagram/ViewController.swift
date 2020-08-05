//
//  ViewController.swift
//  dustinInstagram
//
//  Created by Dustin on 2020/08/04.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Parse


class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var senderlb: UILabel!
    @IBOutlet weak var receiverlb: UILabel!
    let message = String()
    let receiver = String()
    let sender = String()
    let picture = [PFFile]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
     
    }
    
    
    func parseData() {
        //create a class / collectionview / table in heroku
        // PFObject - to create table or some data in table
        
        //unwrap
        let pictureData = imageView.image?.jpegData(compressionQuality: 0.5)
        
        let file = PFFile(name: "pictrue.jpg", data: pictureData!)
        let table = PFObject(className: "Message")
        
        table["sender"] = "Dustin"
        table["receiver"] = "Haeju"
        table["picture"] = file
        
        table.saveInBackground { (success, error) in
            if success {
            print("saved in server")
            } else {
            print(error)
            }
        }
    }
    
    func retreiveData() {
        let information = PFQuery(className: "Message")
        information.findObjectsInBackground { (objects, error) in
            if error == nil {
                for object in objects! {
                    self.receiverlb.text = object["receiver"] as? String
                    self.senderlb.text = object["sender"] as? String
                    
                    let imageFile = object["picture"] as? PFFile
                    imageFile?.getDataInBackground (block: { (data, error) -> Void in
                          if error == nil {
                            if let imageData = data {
                                self.imageView.image = UIImage(data:imageData)
                                         }
                          }
                    })
                    
                }
                
            } else {
                print(error)
            }
        }
        
    }


}

