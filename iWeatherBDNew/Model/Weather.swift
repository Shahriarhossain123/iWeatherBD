//
//  weather.swift
//  iWeatherBDNew
//
//  Created by apple on 3/22/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

struct Weather:Codable {
    let location : Location?
    let current_observation : Current_observation?
    var forecasts : [Forecasts] = []
    
    enum CodingKeys: String, CodingKey {

        case location = "location"
        case current_observation = "current_observation"
        case forecasts = "forecasts"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        current_observation = try values.decodeIfPresent(Current_observation.self, forKey: .current_observation)
        forecasts = try values.decodeIfPresent([Forecasts].self, forKey: .forecasts) ?? []
    }
}

struct Location : Codable {
    let city : String?
    let region : String?
    let woeid : Int?
    let country : String?
    let lat : Double?
    let long : Double?
    let timezone_id : String?

    enum CodingKeys: String, CodingKey {

        case city = "city"
        case region = "region"
        case woeid = "woeid"
        case country = "country"
        case lat = "lat"
        case long = "long"
        case timezone_id = "timezone_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        woeid = try values.decodeIfPresent(Int.self, forKey: .woeid)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        long = try values.decodeIfPresent(Double.self, forKey: .long)
        timezone_id = try values.decodeIfPresent(String.self, forKey: .timezone_id)
    }

}

struct Current_observation : Codable {
    let wind : Wind?
    let atmosphere : Atmosphere?
    let astronomy : Astronomy?
    let condition : Condition?
    let pubDate : Int?

    enum CodingKeys: String, CodingKey {

        case wind = "wind"
        case atmosphere = "atmosphere"
        case astronomy = "astronomy"
        case condition = "condition"
        case pubDate = "pubDate"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
        atmosphere = try values.decodeIfPresent(Atmosphere.self, forKey: .atmosphere)
        astronomy = try values.decodeIfPresent(Astronomy.self, forKey: .astronomy)
        condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
        pubDate = try values.decodeIfPresent(Int.self, forKey: .pubDate)
    }

}

struct Wind : Codable {
    let chill : Int?
    let direction : Int?
    let speed : Double?

    enum CodingKeys: String, CodingKey {

        case chill = "chill"
        case direction = "direction"
        case speed = "speed"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        chill = try values.decodeIfPresent(Int.self, forKey: .chill)
        direction = try values.decodeIfPresent(Int.self, forKey: .direction)
        speed = try values.decodeIfPresent(Double.self, forKey: .speed)
    }

}

struct Astronomy : Codable {
    let sunrise : String?
    let sunset : String?

    enum CodingKeys: String, CodingKey {

        case sunrise = "sunrise"
        case sunset = "sunset"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sunrise = try values.decodeIfPresent(String.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(String.self, forKey: .sunset)
    }

}

struct Atmosphere : Codable {
    let humidity : Int?
    let visibility : Double?
    let pressure : Double?
    let rising : Int?

    enum CodingKeys: String, CodingKey {

        case humidity = "humidity"
        case visibility = "visibility"
        case pressure = "pressure"
        case rising = "rising"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        visibility = try values.decodeIfPresent(Double.self, forKey: .visibility)
        pressure = try values.decodeIfPresent(Double.self, forKey: .pressure)
        rising = try values.decodeIfPresent(Int.self, forKey: .rising)
    }

}

struct Condition : Codable {
    let text : String?
    let code : Int?
    let temperature : Int?

    enum CodingKeys: String, CodingKey {

        case text = "text"
        case code = "code"
        case temperature = "temperature"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        temperature = try values.decodeIfPresent(Int.self, forKey: .temperature)
    }

}

struct Forecasts : Codable {
    let day : String?
    let date : Int?
    let low : Int?
    let high : Int?
    let text : String?
    let code : Int?

    enum CodingKeys: String, CodingKey {

        case day = "day"
        case date = "date"
        case low = "low"
        case high = "high"
        case text = "text"
        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        day = try values.decodeIfPresent(String.self, forKey: .day)
        date = try values.decodeIfPresent(Int.self, forKey: .date)
        low = try values.decodeIfPresent(Int.self, forKey: .low)
        high = try values.decodeIfPresent(Int.self, forKey: .high)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }

}
