//
//  Alarm.swift
//  Alarmp1
//
//  Created by Xavier on 9/3/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import Foundation

class Alarm: Equatable, Codable {
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        if lhs.enabled != rhs.enabled { return false}
        if lhs.fireDate != rhs.fireDate { return false }
        if lhs.name != rhs.name { return false }
        if lhs.uuid != rhs.uuid { return false  }
        return true
    }
    
    
    init(name:String, uuid: String = UUID().uuidString, fireDate: Date, enabled: Bool = true){
        self.name = name
        self.fireDate = fireDate
        self.enabled = enabled
        self.uuid = uuid
    }
//Properties
    var fireDate: Date
    var name: String
    let uuid: String
    var enabled: Bool
    
    var fireTimeAsString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: fireDate)
    }
}












