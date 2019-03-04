//
//  AddTripViewController.swift
//  Mikado
//
//  Created by Yichen Cao on 2019-03-02.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    
    
    @IBOutlet weak var end_date: UITextField!
    @IBOutlet weak var start_date: UITextField!
    private var start_datepicker: UIDatePicker?
    private var end_datepicker: UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        start_datepicker = UIDatePicker()
        start_datepicker?.datePickerMode = .date
        start_datepicker?.addTarget(self, action: #selector(AddTripViewController.startdatechanged(datepicker:)), for: .valueChanged)
        
        end_datepicker = UIDatePicker()
        end_datepicker?.datePickerMode = .date
        end_datepicker?.addTarget(self, action: #selector(AddTripViewController.enddatechanged(datepicker:)), for: .valueChanged)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddTripViewController.viewtapped(gestureRecognizer:)))
        view.addGestureRecognizer(tap)
        start_date.inputView = start_datepicker
        end_date.inputView = end_datepicker
        
    }
    
    @objc func viewtapped(gestureRecognizer:UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func startdatechanged(datepicker:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        start_date.text = formatter.string(from: start_datepicker!.date)
        view.endEditing(true)
    }
    
    @objc func enddatechanged(datepicker:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        end_date.text = formatter.string(from: end_datepicker!.date)
        view.endEditing(true)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
