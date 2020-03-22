//
//  ViewController.swift
//  iWeatherBDNew
//
//  Created by apple on 3/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mobileText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signinUI: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        editUIViews()
    }
    
    func editUIViews(){
        
        //self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        //
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        signinUI.layer.cornerRadius = 8
        signinUI.layer.shadowColor = UIColor(red: 255/255, green: 150/255, blue: 15/255, alpha: 1.0).cgColor
        signinUI.layer.shadowOpacity = 1
        signinUI.layer.shadowOffset = .zero
        signinUI.layer.shadowRadius = 3
        
        mobileText.layer.cornerRadius = 8
        mobileText.layer.borderColor = UIColor.clear.cgColor
        
        passwordText.layer.cornerRadius = 8
        passwordText.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func SignInAction(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "HomeVCTab") as! UITabBarController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignUPVC")
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

