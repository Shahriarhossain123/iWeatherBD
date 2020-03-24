//
//  DistrictVC.swift
//  iWeatherBDNew
//
//  Created by apple on 3/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class DistrictVC: UITableViewController {
        
    var districtNameArray : [DistrictList] = []
    var checkedIndexPath : NSIndexPath?
    var selectedDistrict:DistrictList?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        Districtpostdata()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc func dismiss(){
        self.dismiss(animated: true)
    }
    
    // MARK: - Table view data source
    func Districtpostdata(){
        let parameters = ["tid":1] as [String : Any]
        //let parameters = ["mobile":"017 42011644", "password": "123456"] as [String : Any]
        
        //create the url with URL
        let url = URL(string: "http://mstpharmabd.com/adminpanel/API/district.php")! //change the url
        
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
                    let myData = try JSONDecoder().decode(DistrictModel.self, from: data)
                    self.districtNameArray = myData.districtlist
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }
                }
            } catch let error {
                
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return districtNameArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "discell", for: indexPath)
        
        cell.textLabel?.text = districtNameArray[indexPath.row].district_name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let district = districtNameArray[indexPath.row]
        selectedDistrict = district
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (self.checkedIndexPath != nil) {
            let cell = tableView.cellForRow(at: self.checkedIndexPath! as IndexPath)
            cell?.accessoryType = .none
        }
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
        self.checkedIndexPath = indexPath as NSIndexPath
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        
        guard let seld = selectedDistrict,let name = seld.district_name, let disid = seld.id else {
            return
        }
        UserDefaults.standard.set(name, forKey: "DistrictName")
        UserDefaults.standard.set(disid, forKey: "DistrictID")
        UserDefaults.standard.synchronize()

        self.navigationController?.popViewController(animated: true)
    }
    
    
}
