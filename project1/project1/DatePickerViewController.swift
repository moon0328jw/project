//
//  DatePickerViewController.swift
//  project1
//
//  Created by 문주원 on 2020/06/08.
//  Copyright © 2020 문주원. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet var dateTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()

        // Do any additional setup after loading the view.
    }
    
    func createDatePicker() {
        dateTextField.textAlignment = .center
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        
        dateTextField.inputAccessoryView = toolBar
        
        dateTextField.inputView = datePicker
        
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
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
