//
//  HelpCenterMap.swift
//  iWeatherBDNew
//
//  Created by apple on 3/23/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

struct HelpCenterMap : Codable {
    var help_center : [HelpCentermap]
    
    enum CodingKeys: String, CodingKey {
        
        case help_center = "help_center"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        help_center = try values.decodeIfPresent([HelpCentermap].self, forKey: .help_center)!
    }
    
}

struct HelpCentermap : Codable {
    let sn : String?
    let hc_id : String?
    let hc_name : String?
    let address : String?
    let latitude : String?
    let longitude : String?
    let mobile : String?
    let district_name : String?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        
        case sn = "sn"
        case hc_id = "hc_id"
        case hc_name = "hc_name"
        case address = "address"
        case latitude = "latitude"
        case longitude = "longitude"
        case mobile = "mobile"
        case district_name = "district_name"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sn = try values.decodeIfPresent(String.self, forKey: .sn)
        hc_id = try values.decodeIfPresent(String.self, forKey: .hc_id)
        hc_name = try values.decodeIfPresent(String.self, forKey: .hc_name)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        district_name = try values.decodeIfPresent(String.self, forKey: .district_name)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}
