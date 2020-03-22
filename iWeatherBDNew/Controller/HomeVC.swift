//
//  HomeVC.swift
//  iWeatherBDNew
//
//  Created by apple on 3/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var sunRiseTime: UILabel!
    @IBOutlet weak var sunSetTime: UILabel!
    @IBOutlet weak var windSpeedLAbel: UILabel!
    @IBOutlet weak var HumidtyLabel: UILabel!
    @IBOutlet weak var Visibility: UILabel!
    @IBOutlet weak var FriTemperatureLabel: UILabel!
    @IBOutlet weak var SatTemperatureLabel: UILabel!
    @IBOutlet weak var SunTemperatureLabel: UILabel!
    @IBOutlet weak var MonTemperatureLabel: UILabel!
    @IBOutlet weak var TueTemperatureLabel: UILabel!
    @IBOutlet weak var WedTemperatureLabel: UILabel!
    @IBOutlet weak var ThuTemperatureLabel: UILabel!
    @IBOutlet weak var lowFriTemperatureLabel: UILabel!
    @IBOutlet weak var lowSatTemperatureLabel: UILabel!
    @IBOutlet weak var lowSunTemperatureLabel: UILabel!
    @IBOutlet weak var lowMonTemperatureLabel: UILabel!
    @IBOutlet weak var lowTueTemperatureLabel: UILabel!
    @IBOutlet weak var lowWedTemperatureLabel: UILabel!
    @IBOutlet weak var lowThuTemperatureLabel: UILabel!
    @IBOutlet weak var FriImage: UIImageView!
    @IBOutlet weak var SatImage: UIImageView!
    @IBOutlet weak var SunImage: UIImageView!
    @IBOutlet weak var MonImage: UIImageView!
    @IBOutlet weak var TueImage: UIImageView!
    @IBOutlet weak var WedImage: UIImageView!
    @IBOutlet weak var ThuImage: UIImageView!
    
    var weatherModel:Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named:"bdwelcome")!)
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            self.Weatherpostdata()
        }
        
    }
    
    func Weatherpostdata(){
        let parameters = ["tid":1] as [String : Any]
        //let parameters = ["mobile":"017 42011644", "password": "123456"] as [String : Any]
        
        //create the url with URL
        let url = URL(string: "http://mstpharmabd.com/adminpanel/API/weather.php")! //change the url
        
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
                    let myData = try JSONDecoder().decode(Weather.self, from: data)
                    self.weatherModel = myData
                    DispatchQueue.main.async {
                        self.cityLabel.text = self.weatherModel?.location?.city!
                        self.conditionLabel.text = self.weatherModel?.current_observation?.condition?.text!
                        self.conditionImage.image = UIImage(named: self.weatherModel!.current_observation!.condition!.text!)
                        self.temperatureLabel.text = String(self.weatherModel!.current_observation!.condition!.temperature!)
                        self.sunRiseTime.text = self.weatherModel?.current_observation?.astronomy?.sunrise!
                        self.sunSetTime.text = self.weatherModel?.current_observation?.astronomy?.sunset!
                        self.windSpeedLAbel.text = String( self.weatherModel!.current_observation!.wind!.speed!)
                        self.HumidtyLabel.text = "\(String(describing: self.weatherModel!.current_observation!.atmosphere!.humidity!))%"
                        self.Visibility.text = "\(String(describing: self.weatherModel!.current_observation!.atmosphere!.visibility!))%"
                        
                        let fri:Forecasts = (self.weatherModel?.forecasts[5])!
                        self.FriTemperatureLabel.text = "\(String(describing: fri.high!))"
                        self.lowFriTemperatureLabel.text = "\(String(describing: fri.low!))"
                        self.FriImage.image = UIImage(named: fri.text!)
                        
                        let sat:Forecasts = (self.weatherModel?.forecasts[6])!
                        self.SatTemperatureLabel.text = "\(String(describing: sat.high!))"
                        self.lowSatTemperatureLabel.text = "\(String(describing: sat.low!))"
                        self.SatImage.image = UIImage(named: sat.text!)
                        
                        let sun:Forecasts = (self.weatherModel?.forecasts[0])!
                        self.SunTemperatureLabel.text = "\(String(describing: sun.high!))"
                        self.lowSunTemperatureLabel.text = "\(String(describing: sun.low!))"
                        self.SunImage.image = UIImage(named: sun.text!)
                        
                        let mon:Forecasts = (self.weatherModel?.forecasts[1])!
                        self.MonTemperatureLabel.text = "\(String(describing: mon.high!))"
                        self.lowMonTemperatureLabel.text = "\(String(describing: mon.low!))"
                        self.MonImage.image = UIImage(named: mon.text!)
                        
                        let tue:Forecasts = (self.weatherModel?.forecasts[2])!
                        self.TueTemperatureLabel.text = "\(String(describing: tue.high!))"
                        self.lowTueTemperatureLabel.text = "\(String(describing: tue.low!))"
                        self.TueImage.image = UIImage(named: tue.text!)
                        
                        let wed:Forecasts = (self.weatherModel?.forecasts[3])!
                        self.WedTemperatureLabel.text = "\(String(describing: wed.high!))"
                        self.lowWedTemperatureLabel.text = "\(String(describing: wed.low!))"
                        self.WedImage.image = UIImage(named: wed.text!)
                        
                        let thu:Forecasts = (self.weatherModel?.forecasts[4])!
                        self.ThuTemperatureLabel.text = "\(String(describing: thu.high!))"
                        self.lowThuTemperatureLabel.text = "\(String(describing: thu.low!))"
                        self.ThuImage.image = UIImage(named: thu.text!)
                        
                    }
                }
            } catch let error {
                
                print(error.localizedDescription)
            }
        })
        task.resume()
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
