//
//  NoticeModel.swift
//  iWeatherBDNew
//
//  Created by apple on 3/24/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

struct NoticeModel : Codable {
    var notice : [Notice] = []
    
    enum CodingKeys: String, CodingKey {
        
        case notice = "notice"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        notice = try values.decodeIfPresent([Notice].self, forKey: .notice) ?? []
    }
}

struct Notice : Codable {
    let sn : String?
    let id : String?
    let title : String?
    let description : String?
    let type : String?
    let fromdate : String?
    let tid : String?
    let todate : String?
    let tdate : String?
    
    enum CodingKeys: String, CodingKey {
        
        case sn = "sn"
        case id = "id"
        case title = "title"
        case description = "description"
        case type = "type"
        case fromdate = "fromdate"
        case tid = "tid"
        case todate = "todate"
        case tdate = "tdate"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sn = try values.decodeIfPresent(String.self, forKey: .sn)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        fromdate = try values.decodeIfPresent(String.self, forKey: .fromdate)
        tid = try values.decodeIfPresent(String.self, forKey: .tid)
        todate = try values.decodeIfPresent(String.self, forKey: .todate)
        tdate = try values.decodeIfPresent(String.self, forKey: .tdate)
    }
    
}
