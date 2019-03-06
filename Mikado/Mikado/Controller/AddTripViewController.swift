//
//  AddTripViewController.swift
//  Mikado
//
//  Created by Yichen Cao on 2019-03-02.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController, UITextFieldDelegate {
    
    // set up of a child of main view (UIscrollview)
    @IBOutlet weak var scroll: UIScrollView!
    
    // content view (child of UIscrollview)
    @IBOutlet weak var content: UIView!
    
    // 4 text fields to update properties of a trip object
    @IBOutlet weak var end_date: UITextField!
    @IBOutlet weak var start_date: UITextField!
    @IBOutlet weak var destination: UITextField!
    @IBOutlet weak var trip_name: UITextField!
    
    // completion of a trip object setup
    @IBOutlet weak var submit: UIButton!
    
    // datepicker helper variables
    private var start_datepicker: UIDatePicker?
    private var end_datepicker: UIDatePicker?

    // instantiate a trip object
    private var trip: Trip = Trip.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the size of the scroll view
        scroll.contentSize = self.view.frame.size
        
        //observer of keyboard
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        // loading the datepicker for user to select a date
        start_datepicker = UIDatePicker()
        start_datepicker?.datePickerMode = .date
        start_datepicker?.addTarget(self, action: #selector(AddTripViewController.startdatechanged(datepicker:)), for: .valueChanged)
        
        end_datepicker = UIDatePicker()
        end_datepicker?.datePickerMode = .date
        end_datepicker?.addTarget(self, action: #selector(AddTripViewController.enddatechanged(datepicker:)), for: .valueChanged)
        
        // tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddTripViewController.viewtapped(gestureRecognizer:)))
        view.addGestureRecognizer(tap)
        
        // date view setup
        start_date.inputView = start_datepicker
        end_date.inputView = end_datepicker
    }
    
    @objc func viewtapped(gestureRecognizer:UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    // update start date in our trip object
    @objc func startdatechanged(datepicker:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        let startDateString : String = formatter.string(from: start_datepicker!.date)
        start_date.text = startDateString
        trip.update_start_date(dateString: startDateString)
        print(trip.start_date)
        view.endEditing(true)
    }
    
    // update end date in our trip object
    @objc func enddatechanged(datepicker:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        let endDateString : String = formatter.string(from: end_datepicker!.date)
        end_date.text = endDateString
        trip.update_end_date(dateString: endDateString)
        print(trip.end_date)
        view.endEditing(true)
    }
    
    // update destination
    @IBAction func updateDes(_ sender: Any) {
        trip.update_destination(dataString: destination.text!)
        print(trip.destination)
        view.endEditing(true)
    }
    
    // update trip title
    @IBAction func updateTripName(_ sender: Any) {
        trip.update_title(dataString: trip_name.text!)
        print(trip.title)
        view.endEditing(true)
    }
    
    // adjust the screen size if keyboard will cover our text field
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            scroll.contentInset = UIEdgeInsets.zero
        } else {
            scroll.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        scroll.scrollIndicatorInsets = scroll.contentInset
    }
    
    @IBAction func update_trip_array(_ sender: UIButton) {
        
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
