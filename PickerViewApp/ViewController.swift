//
//  ViewController.swift
//  PickerViewApp
//
//  Created by Evgeniy Ryshkov on 05.04.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentYearInDatePicker: String?
    var previousYearInDatePicker: String?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerChange(sender:)), for: .valueChanged)
        self.datePickerChange(sender: datePicker)
        
        timePicker.delegate = self
        timePicker.dataSource = self
    }
    
    @objc func datePickerChange(sender: UIDatePicker){
        if sender.isEqual(self.datePicker){
            let date = sender.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 60*60*3)
            dateLabel.text = dateFormatter.string(from: date)
            
            dateFormatter.dateFormat = "yyyy"
            self.currentYearInDatePicker = dateFormatter.string(from: date)
            
            if let currentYear = currentYearInDatePicker, let previousYear = previousYearInDatePicker {
                if currentYear != previousYear {
                    print("Show next view")
                }
            }
            self.previousYearInDatePicker = currentYearInDatePicker
        }
        
    }
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        default:
            return 60
        }
    }
    
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row)h"
        case 1:
            return "\(row)m"
        case 2:
            return "\(row)s"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
 
        let hours = pickerView.selectedRow(inComponent: 0).addZero()
        let minutes = pickerView.selectedRow(inComponent: 1).addZero()
        let seconds = pickerView.selectedRow(inComponent: 2).addZero()
        
        let stringFromPicker = "\(hours):\(minutes):\(seconds)"
        
        timeLabel.text = stringFromPicker
        
        let ac = UIAlertController(title: "Info", message: "\(stringFromPicker) was selected", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(action)
        self.present(ac, animated: true, completion: nil)
    }
}













