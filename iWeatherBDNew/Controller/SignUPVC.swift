//
//  SignUPVC.swift
//  iWeatherBDNew
//
//  Created by apple on 3/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SignUPVC: UIViewController {
    
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var lastText: UITextField!
    @IBOutlet weak var mobileText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signupUI: UIButton!
    @IBOutlet weak var districtText: UIButton!
    @IBOutlet weak var maleOutlet: UIButton!
    @IBOutlet weak var femaleOutlet: UIButton!
    @IBOutlet weak var otherOutlet: UIButton!
    
    var isChecked = false
    
    var gender = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        // Do any additional setup after loading the view.
        editUIView()
    }
    
    func editUIView() {
        
        signupUI.layer.cornerRadius = 8
        signupUI.layer.shadowColor = UIColor(red: 255/255, green: 150/255, blue: 15/255, alpha: 1.0).cgColor
        signupUI.layer.shadowOpacity = 1
        signupUI.layer.shadowOffset = .zero
        signupUI.layer.shadowRadius = 3
        
        districtText.layer.cornerRadius = 8
        
        editMaleButton()
        editFamaleButton()
        editOtherButton()
    }
    
    func editMaleButton() {
        maleOutlet.layer.cornerRadius = 8
        maleOutlet.layer.backgroundColor = UIColor.white.cgColor
        maleOutlet.layer.borderWidth = 1
        maleOutlet.layer.borderColor = UIColor(red: 37/255, green: 58/255, blue: 75/255, alpha: 1.0).cgColor
    }
    
    func editFamaleButton() {
        femaleOutlet.layer.cornerRadius = 8
        femaleOutlet.layer.backgroundColor = UIColor.white.cgColor
        femaleOutlet.layer.borderWidth = 1
        femaleOutlet.layer.borderColor = UIColor(red: 37/255, green: 58/255, blue: 75/255, alpha: 1.0).cgColor
    }
    
    func editOtherButton() {
        otherOutlet.layer.cornerRadius = 8
        otherOutlet.layer.backgroundColor = UIColor.white.cgColor
        otherOutlet.layer.borderWidth = 1
        otherOutlet.layer.borderColor = UIColor(red: 37/255, green: 58/255, blue: 75/255, alpha: 1.0).cgColor
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func signinAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "loginvc")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeVC")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func isCheckedAction(_ sender: UIButton) {
        if sender.tag == 1 {
            print("Male")
            gender = "Male"
            maleOutlet.layer.backgroundColor = UIColor(red: 37/255, green: 58/255, blue: 75/255, alpha: 1.0).cgColor
            editFamaleButton()
            editOtherButton()
            
        } else if sender.tag == 2{
            print("Female")
            gender = "Female"
            femaleOutlet.layer.backgroundColor = UIColor(red: 37/255, green: 58/255, blue: 75/255, alpha: 1.0).cgColor
            editMaleButton()
            editOtherButton()
            
        } else if sender.tag == 3{
            print("Other")
            gender = "Other"
            otherOutlet.layer.backgroundColor = UIColor(red: 37/255, green: 58/255, blue: 75/255, alpha: 1.0).cgColor
            editMaleButton()
            editFamaleButton()
        }
    }
    
    @IBAction func selectdistrictAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DistrictVC")
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
