//
//  SettingVC.swift
//  iWeatherBDNew
//
//  Created by apple on 3/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SettingVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var settingTable: UITableView!
    
    var items = ["District","Language"]
    var itemsImage = ["Icon ionic-ios-send","Icon material-language"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingTable.rowHeight = 60
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SettingCell
        
        cell.ShowLabel.text = items[indexPath.row]
        cell.showImage.image = UIImage(named: itemsImage[indexPath.row])
        cell.Showtitile.text = "Ok"
        
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if items[indexPath.row] == items[0] {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "DistrictVC")
            self.navigationController?.pushViewController(controller, animated: true)
        } else if items[indexPath.row] == items[1] {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "LanguageVC")
            self.navigationController?.pushViewController(controller, animated: true)
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
    
//    func getDefaultDistrictName() -> String?{
//        guard let name =   UserDefaults.standard.value(forKey: "DistrictName") else {return}
//    }

}


