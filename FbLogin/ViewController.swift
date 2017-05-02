//
//  ViewController.swift
//  FbLogin
//
//  Created by ANKIT SHARMA on 16/03/17.
//  Copyright © 2017 ANKIT SHARMA. All rights reserved.
//


import UIKit
import FacebookLogin
import FacebookCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        // Add a custom login button to your app
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.darkGray
        myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
        myLoginButton.center = view.center
        myLoginButton.setTitle("My Login Button", for: .normal)
        
        // Handle clicks on the button


       
        myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: UIControlEvents.touchUpInside)
        // Add the button to the view
        view.addSubview(myLoginButton)
    }
    
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        print("LOGIN MANAGER: \(loginManager)")
        loginManager.logIn([ .publicProfile, .email ], viewController: self) { loginResult in
            print("LOGIN RESULT! \(loginResult)")
            switch loginResult {
            case .failed(let error):
                print("FACEBOOK LOGIN FAILED: \(error)")
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                print("GRANTED PERMISSIONS: \(grantedPermissions)")
                print("DECLINED PERMISSIONS: \(declinedPermissions)")
                print("ACCESS TOKEN \(accessToken)")
            }
        }    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

