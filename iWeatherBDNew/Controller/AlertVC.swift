//
//  AlertVC.swift
//  iWeatherBDNew
//
//  Created by apple on 3/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class AlertVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
     
    var titles = ["Some Alert","Some Alert"]
    var images = ["bdwelcome","bdwelcome"]

    @IBOutlet weak var AlertTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        AlertTable.rowHeight = 210
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AlertCell
        
        cell.ShowLabel.text = titles[indexPath.row]
        cell.showImage.image = UIImage(named: images[indexPath.row])
        
        return cell
        
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
