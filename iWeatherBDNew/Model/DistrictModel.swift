//
//  DistrictModel.swift
//  iWeatherBDNew
//
//  Created by apple on 3/24/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

struct DistrictModel : Codable {
    var districtlist : [DistrictList] = []
    
    enum CodingKeys: String, CodingKey {
        
        case districtlist = "district_list"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        districtlist = try values.decodeIfPresent([DistrictList].self, forKey: .districtlist) ?? []
    }
}

struct DistrictList : Codable {
    let sn : String?
    let id : String?
    let district_name : String?
    
    enum CodingKeys: String, CodingKey {
        
        case sn = "sn"
        case id = "id"
        case district_name = "district_name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sn = try values.decodeIfPresent(String.self, forKey: .sn)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        district_name = try values.decodeIfPresent(String.self, forKey: .district_name)
    }
    
}
