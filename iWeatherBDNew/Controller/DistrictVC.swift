//
//  DistrictVC.swift
//  iWeatherBDNew
//
//  Created by apple on 3/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class DistrictVC: UITableViewController {
    
    var All_districts = ["Chittagong", "Rajshahi", "Khulna", "Barisal", "Sylhet", "Dhaka", "Rangpur" , "Mymensingh","Comilla", "Feni", "Brahmanbaria", "Rangamati", "Noakhali", "Chandpur", "Lakshmipur", "Chittagong", "Coxsbazar", "Khagrachhari", "Bandarban","Sirajganj", "Pabna", "Bogra", "Rajshahi", "Natore", "Joypurhat", "Chapainawabganj", "Naogaon", "Jhalakathi", "Patuakhali", "Pirojpur", "Barisal", "Bhola", "Barguna", "Jessore", "Satkhira", "Meherpur", "Narail", "Chuadanga", "Kushtia", "Magura", "Khulna", "Bagerhat", "Jhenaidah", "Sylhet", "Moulvibazar" , "Habiganj", "Sunamganj" ,"Narsingdi", "Gazipur", "Shariatpur", "Narayanganj", "Tangail", "Kishoreganj", "Manikganj", "Dhaka", "Munshiganj", "Rajbari", "Madaripur", "Gopalganj", "Faridpur","Panchagarh", "Dinajpur", "Lalmonirhat", "Nilphamari", "Gaibandha", "Thakurgaon", "Rangpur", "Kurigram","Sherpur", "Mymensingh", "Jamalpur", "Netrokona"]
    
    var district_name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return All_districts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "discell", for: indexPath)
        
        cell.textLabel?.text = All_districts[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        district_name = All_districts[indexPath.row]
        print(district_name)
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
