//
//  AlertVC.swift
//  iWeatherBDNew
//
//  Created by apple on 3/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

enum NoticeType {
    case general
    case emergency
}

class AlertVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var typeSegmentedOutlet: UISegmentedControl!
    
    @IBOutlet weak var Indicator: UIActivityIndicatorView!
    @IBOutlet weak var AlertTable: UITableView!
    
    var noticeModelArray : [Notice] = []
    
    var noticeType:NoticeType = .general
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noticeType = .general
        typeSegmentedOutlet.selectedSegmentIndex = 0
        AlertTable.rowHeight = 210
        noticeModelArray = []
        Alert_center(noticeType)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func typeSegmentedAction(_ sender: UISegmentedControl) {
        noticeType = sender.selectedSegmentIndex == 0 ?.general:.emergency
        Alert_center(noticeType)

        
    }
    
    func Alert_center( _ type:NoticeType ){
        /* var parameters:[String:Any] = [:]
         if noticeType == .general {
         parameters["tid"] = "1"
         }
         else{
         parameters["tid"] = "2"
         }*/
        
        Indicator.startAnimating()
        let parameters = ["tid": noticeType == .general ? "1":"2"] as [String : Any]
        //let parameters = ["mobile":"017 42011644", "password": "123456"] as [String : Any]
        
        //create the url with URL
        let url = URL(string: "http://mstpharmabd.com/adminpanel/API/notice.php")! //change the url
        
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
                    let myData = try JSONDecoder().decode(NoticeModel.self, from: data)
                    self.noticeModelArray = myData.notice
                    DispatchQueue.main.async {
                        self.Indicator.stopAnimating()
                        self.AlertTable.reloadData()
                    }                }
            } catch let error {
                
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AlertCell
        let notice:Notice = noticeModelArray[indexPath.row]
        cell.fill(notice)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SaveZoneMapVC")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
