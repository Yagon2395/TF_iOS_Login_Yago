//
//  HomeViewController.swift
//  TF_iOS_Login_Yago
//
//  Created by Desenvolvimento on 10/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func performLogout(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "isAuthenticated")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        UIApplication.shared.keyWindow?.rootViewController = vc
        //performSegue(withIdentifier: "logoutUse", sender: nil)
    }
}
