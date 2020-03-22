//
//  EditPassword.swift
//  iWeatherBDNew
//
//  Created by apple on 3/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EditPassword: UIViewController {
    @IBOutlet weak var updateOulet: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var ConfrimText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editUIView()
        // Do any additional setup after loading the view.
    }
    
    func editUIView() {
        
        updateOulet.layer.cornerRadius = 8
        updateOulet.layer.shadowColor = UIColor(red: 255/255, green: 150/255, blue: 15/255, alpha: 1.0).cgColor
        updateOulet.layer.shadowOpacity = 1
        updateOulet.layer.shadowOffset = .zero
        updateOulet.layer.shadowRadius = 3
        
        
        
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
