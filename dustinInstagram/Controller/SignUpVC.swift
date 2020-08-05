//
//  SignUpVC.swift
//  dustinInstagram
//
//  Created by Dustin on 2020/08/05.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var scrollViewHeight : CGFloat = 0
    var keyboard = CGRect()
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswrodTextfield: UITextField!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var webTextField: UITextField!
    
    @IBOutlet weak var SignUpBtn: UIButton!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    
    @IBOutlet weak var mainImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        scrollView.contentSize.height = self.view.frame.height
        scrollViewHeight = scrollView.frame.size.height
        
        
        let notifier = NotificationCenter.default
        notifier.addObserver(self,
                             selector: #selector(showKeyBoard),
                             name: UIWindow.keyboardWillShowNotification,
                             object: nil)
        notifier.addObserver(self,
                             selector: #selector(hideKeyBoard),
                             name: UIWindow.keyboardWillHideNotification,
                             object: nil)
        
        
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoardTap))
        
        
        
    }
    
    @objc func showKeyBoard(notification: NSNotification) {
        
        keyboard = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]! as! CGRect
        
        UIView.animate(withDuration: 0.4) {
            self.scrollView.frame.size.height = self.scrollViewHeight - self.keyboard.height
        }
    }
    
    @objc func hideKeyBoard(notification: NSNotification) {
        
        UIView.animate(withDuration: 0.4) {
            self.scrollView.frame.size.height = self.view.frame.height
        }
        
        
    }
    
    @objc func hideKeyBoardTap() {
        
    }

    
    @IBAction func handleSignUp(_ sender: UIButton) {
    }
    
    @IBAction func handleCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
