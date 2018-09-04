//
//  AlarmController.swift
//  Alarmp1
//
//  Created by Xavier on 9/3/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//CRUD

import Foundation

class AlarmController {
    
    static let shared = AlarmController()
    
    //Source Of Truth
    var alarms = [Alarm]()
    
    //CREATE
    func create(fireDate: Date, name: String, enabled:Bool) {
        
    }
    //Update
    func update(alarm:Alarm, fireDate: Date, name: String, enabled: Bool) {
        
    }
    //DELETE
    func delete(alarm:Alarm) {
    
    }
}




















