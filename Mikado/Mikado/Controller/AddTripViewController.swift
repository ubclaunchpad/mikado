//
//  AddTripViewController.swift
//  Mikado
//
//  Created by Yichen Cao on 2019-03-02.
//  Copyright © 2019 Aziz Zaynutdinov. All rights reserved.
//

import UIKit
import Foundation

class AddTripViewController: UIViewController, UITextFieldDelegate {
    
    // set up of a child of main view (UIscrollview)
    @IBOutlet weak var scroll: UIScrollView!
    
    // content view (child of UIscrollview)
    @IBOutlet weak var content: UIView!
    
    // 4 text fields to update properties of a trip object
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var destination: UITextField!
    @IBOutlet weak var tripName: UITextField!
    
    // completion of a trip object setup
    @IBOutlet weak var submit: UIButton!
    
    // datepicker helper variables
    private var startDatepicker: UIDatePicker?
    private var endDatepicker: UIDatePicker?

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
        startDatepicker = UIDatePicker()
        startDatepicker?.datePickerMode = .date
        startDatepicker?.addTarget(self, action: #selector(AddTripViewController.startDateChanged), for: .valueChanged)
        
        endDatepicker = UIDatePicker()
        endDatepicker?.datePickerMode = .date
        endDatepicker?.addTarget(self, action: #selector(AddTripViewController.endDateChanged), for: .valueChanged)
        
        // tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddTripViewController.viewTapped))
        view.addGestureRecognizer(tap)
        
        // date view setup
        startDate.inputView = startDatepicker
        endDate.inputView = endDatepicker
    }
    
    @objc func viewTapped(gestureRecognizer:UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    // update start date in our trip object
    @objc func startDateChanged(datepicker:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        let startDateString : String = formatter.string(from: startDatepicker!.date)
        startDate.text = startDateString
        //trip.startDate = NSDate(dataString: startDateString)
        print(trip.startDate)
        view.endEditing(true)
    }
    
    // update end date in our trip object
    @objc func endDateChanged(datepicker:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        let endDateString : String = formatter.string(from: endDatepicker!.date)
        endDate.text = endDateString
        trip.updateEndDate(dateString: endDateString)
        print(trip.endDate)
        view.endEditing(true)
    }
    
    // update destination
    @IBAction func updateDes(_ sender: Any) {
        trip.destination = destination.text!
        print(trip.destination)
        view.endEditing(true)
    }
    
    // update trip title
    @IBAction func updateTripName(_ sender: Any) {
        trip.title = tripName.text!
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
    
    @IBAction func updateTrip(_ sender: UIButton) {
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


