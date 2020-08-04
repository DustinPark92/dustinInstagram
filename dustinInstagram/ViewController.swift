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

    override func viewDidLoad() {
        super.viewDidLoad()
        let object = PFObject(className: "testObject")
        object["name"] = "Dustin"
        object["lastname"] = "Park"
        object.saveInBackground { (done, error) in
            if done {
                print( "saved in server")
            } else {
                print(error)
            }
        }
    }


}


//  if done {
//      print( "saved in server" )
//  } else {
//      print(error)
//  }
