//
//  SaveZoneMapVC.swift
//  iWeatherBDNew
//
//  Created by apple on 3/23/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class SaveZoneMapVC: UIViewController {
     
    var helpCenters : [HelpCentermap] = []
    
    var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let coords = [[Double(latitude),Double(longitude)]]
        
        GMSServices.provideAPIKey("AIzaSyBa9N1QhniNwe1GZGN0iBj1VynkcAGIpBE")
        
        let camera = GMSCameraPosition.camera(withLatitude: 23.805349, longitude: 90.370014, zoom: 15.0)
        
        self.mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        fetchEmergencyCenter()
        
        // Do any additional setup after loading the view.
    }
    
    func fetchEmergencyCenter(){
        let parameters = ["tid":1] as [String : Any]
        //let parameters = ["mobile":"017 42011644", "password": "123456"] as [String : Any]
        
        //create the url with URL
        let url = URL(string: "http://mstpharmabd.com/adminpanel/API/help_center.php")! //change the url
        
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
                    let myData = try JSONDecoder().decode(HelpCenterMap.self, from: data)
                    self.helpCenters = myData.help_center
                    
                    DispatchQueue.main.async {
                        for hc in self.helpCenters{
                            if let lat = hc.latitude, let lng = hc.longitude, let latD = Double(lat), let lngD = Double(lng){
                                 
                                let marker = GMSMarker()
                                marker.position = CLLocationCoordinate2D(latitude:latD, longitude:lngD)
                                marker.map = self.mapView
                                marker.icon = UIImage(named: "material-location-on")
                                marker.title = "Mirpur"
                                
                            }
                        }
                    }
                }
            } catch let error {
                
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
