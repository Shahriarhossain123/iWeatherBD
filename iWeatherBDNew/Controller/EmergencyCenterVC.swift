//
//  EmergencyCenterVC.swift
//  iWeatherBDNew
//
//  Created by apple on 3/23/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import MessageUI

class EmergencyCenterVC: UIViewController, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet weak var mapview: UIView!
    @IBOutlet weak var CenterName: UILabel!
    @IBOutlet weak var CenterNumber: UILabel!
    @IBOutlet weak var phoneCellOutlet: UIButton!
    @IBOutlet weak var massageOutleet: UIButton!
    @IBOutlet weak var centeraddress: UILabel!
    @IBOutlet weak var centerView: UIView!
    
    var emergencyCenters : [EmergencyCenter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        centerEditView()
        Emergency_center()
    }
    
    func centerEditView(){
        mapview.layer.cornerRadius = 8
        mapview.layer.shadowColor = UIColor.darkGray.cgColor
        mapview.layer.shadowOffset = CGSize(width: 0, height: 0)
        mapview.layer.shadowOpacity = 0.5
        mapview.layer.shadowRadius = 2.0
        
        centerView.layer.cornerRadius = 8
        centerView.layer.shadowColor = UIColor.darkGray.cgColor
        centerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        centerView.layer.shadowOpacity = 0.7
        centerView.layer.shadowRadius = 2.0
        
        phoneCellOutlet.layer.cornerRadius = 16
        phoneCellOutlet.layer.shadowColor = UIColor.systemBlue.cgColor
        phoneCellOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
        phoneCellOutlet.layer.shadowOpacity = 0.7
        phoneCellOutlet.layer.shadowRadius = 2.0
        
        massageOutleet.layer.cornerRadius = 16
        massageOutleet.layer.shadowColor = UIColor.systemBlue.cgColor
        massageOutleet.layer.shadowOffset = CGSize(width: 0, height: 0)
        massageOutleet.layer.shadowOpacity = 0.7
        massageOutleet.layer.shadowRadius = 2.0
    }
    
    func Emergency_center(){
        let parameters = ["tid":1] as [String : Any]
        //let parameters = ["mobile":"017 42011644", "password": "123456"] as [String : Any]
        
        //create the url with URL
        let url = URL(string: "http://mstpharmabd.com/adminpanel/API/emergency_center.php")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                
                return
            }
            
            do {
                //create json object from data
                if (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) != nil {
                    //print(json)
                    let myData = try JSONDecoder().decode(HelpCenter.self, from: data)
                    self.emergencyCenters = myData.help_center
                    DispatchQueue.main.async {
                        self.CenterName.text = self.emergencyCenters[0].em_name
                        self.CenterNumber.text = self.emergencyCenters[0].phone
                        self.centeraddress.text = self.emergencyCenters[0].address
                    }
                }
            } catch let error {
                
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    @IBAction func MassageAction(_ sender: UIButton) {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Message Body"
            controller.recipients = ["4151231234"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func PhoneAction(_ sender: UIButton) {
        if let url = URL(string: "tel://\(CenterNumber.text!)"),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
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
