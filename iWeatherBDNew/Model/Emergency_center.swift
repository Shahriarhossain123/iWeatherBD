//
//  Emergency_center.swift
//  iWeatherBDNew
//
//  Created by apple on 3/23/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation



struct HelpCenter:Codable {
    
    var help_center : [EmergencyCenter] = []
    
    enum CodingKeys: String, CodingKey {
        
        case help_center = "help_center"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        help_center = try values.decodeIfPresent([EmergencyCenter].self, forKey: .help_center) ?? []
    } 
}


struct EmergencyCenter:Codable {
    let sn : String
    let ec_id : String
    let em_name : String
    let address : String
    let phone : String
    let district_name : String
    let name : String
    
    enum CodingKeys: String, CodingKey {
        
        case sn = "sn"
        case ec_id = "ec_id"
        case em_name = "em_name"
        case address = "address"
        case phone = "phone"
        case district_name = "district_name"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sn = try values.decodeIfPresent(String.self, forKey: .sn)!
        ec_id = try values.decodeIfPresent(String.self, forKey: .ec_id)!
        em_name = try values.decodeIfPresent(String.self, forKey: .em_name)!
        address = try values.decodeIfPresent(String.self, forKey: .address)!
        phone = try values.decodeIfPresent(String.self, forKey: .phone)!
        district_name = try values.decodeIfPresent(String.self, forKey: .district_name)!
        name = try values.decodeIfPresent(String.self, forKey: .name)!
    }
    
}
