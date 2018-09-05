//
//  AlarmDetailTableViewController.swift
//  Alarmp1
//
//  Created by Xavier on 9/3/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController, AlarmScheduler {
    
    var alarm: Alarm?{
        didSet{
            loadViewIfNeeded()
            self.updateViews()
            
        }
    }
    
    var alarmIsOn:Bool = true
    

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var alarmEnabledButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateViews(){
        
        guard let alarm = alarm else {return}
        alarmIsOn = alarm.enabled
        datePicker.date = alarm.fireDate
        titleTextField.text = alarm.name
        setUpAlarmButton()
        
    }
    
    func setUpAlarmButton(){
        
        switch alarmIsOn {
        case true:
            alarmEnabledButton.backgroundColor = UIColor.yellow
            alarmEnabledButton.setTitle("ON", for: .normal)
        case false:
            alarmEnabledButton.backgroundColor = UIColor.gray
            alarmEnabledButton.setTitle("Off", for: .normal)
        }
    }
    
    
    
    
    
    @IBAction func alarmEnabledButtonTapped(_ sender: UIButton) {
        
        if let alarm = alarm {
            AlarmController.shared.toggleEnabled(for: alarm)
            alarmIsOn = alarm.enabled
        }else{
            alarmIsOn = !alarmIsOn
        }
        setUpAlarmButton()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text else {return}
        guard title != "" else {return}
        
        if let alarm = alarm{
            AlarmController.shared.update(alarm: alarm, name: title, fireDate: datePicker.date, enabled: alarmIsOn)
        } else{
            AlarmController.shared.create(name: title, fireDate: datePicker.date, enabled: alarmIsOn)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

