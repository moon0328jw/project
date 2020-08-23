//
//  AddViewController.swift
//  Table
//
//  Created by 조주혁 on 2020/06/09.
//  Copyright © 2020 Ju-Hyuk Cho. All rights reserved.
//

import UIKit
import Firebase

var items: [String] = []
var startDate: [String] = []
var finishDate: [String] = []
var price: [String] = []
var dDay: [String] = []
var datesArray: [String] = []
var dDayCount: Int = -1

var ref: DatabaseReference!

class AddViewController: UIViewController{
    
    @IBOutlet var textName: UITextField!
    @IBOutlet var textStartDate: UITextField!
    @IBOutlet var textFinishDate: UITextField!
    @IBOutlet var textPrice: UITextField!
    
    let uid: String = (Auth.auth().currentUser?.uid)!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFirstDatePicker()
        createSecondDatePicker()

        // Do any additional setup after loading the view.
    }
    
    func createFirstDatePicker() {
        textStartDate.textAlignment = .center

        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneFirstBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneFirstPressed))
    
        toolBar.setItems([doneFirstBtn], animated: true)
       

        textStartDate.inputAccessoryView = toolBar
      
        textStartDate.inputView = datePicker
        
        datePicker.datePickerMode = .date
    }
    
    @objc func doneFirstPressed() {
           let formatter = DateFormatter()
           formatter.dateStyle = .medium
           formatter.timeStyle = .none
            formatter.dateFormat = "yyyy. MM. dd."
            formatter.locale = Locale(identifier: "ko")
           textStartDate.text = formatter.string(from: datePicker.date)
           self.view.endEditing(true)
    }
    
    func createSecondDatePicker() {
        
        textFinishDate.textAlignment = .center

        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneSecondBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneSecondPressed))
       
        toolBar.setItems([doneSecondBtn], animated: true)
       
        textFinishDate.inputAccessoryView = toolBar
        textStartDate.inputView = datePicker
        textFinishDate.inputView = datePicker

        datePicker.datePickerMode = .date
    }

    @objc func doneSecondPressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy. MM. dd."
        formatter.locale = Locale(identifier: "ko")
        textFinishDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func done() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd."
        let date = Date()
        let nowDateStr = formatter.string(from: date)
        var dates: String = ""
        
        // 만료 년
        var firstIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 0)
        var lastIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 4)
        var year = String(finishDate[dDayCount][firstIndex..<lastIndex])

        // 현재 년
        firstIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 0)
        lastIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 4)
        var currentYear = String(nowDateStr[firstIndex..<lastIndex])

        // 만료 월
        firstIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 6)
        lastIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 8)
        var month = String(finishDate[dDayCount][firstIndex..<lastIndex])
            

        // 현재 월
        firstIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 6)
        lastIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 8)
        var currentMonth = String(nowDateStr[firstIndex..<lastIndex])

        // 만료 일
        firstIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 10)
        lastIndex = finishDate[dDayCount].index(finishDate[dDayCount].startIndex, offsetBy: 12)
        var day = String(finishDate[dDayCount][firstIndex..<lastIndex])

        // 현재 일
        firstIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 10)
        lastIndex = nowDateStr.index(nowDateStr.startIndex, offsetBy: 12)
        let currentDay = String(nowDateStr[firstIndex..<lastIndex])
            
        dates = String(totalDay(y: Int(year)!, m: Int(month)!, d: Int(day)!) - totalDay(y: Int(currentYear)!, m: Int(currentMonth)!, d: Int(currentDay)!))
        datesArray.append(dates)
        dDay.append(datesArray[dDayCount])
        
    }
    
    func totalDay(y: Int, m: Int, d: Int) -> Int {
        var monthArray: [Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
        var total: Int = 0
        
        total = ((y - 1)*365) + ((y - 1)/4) - ((y - 1)/100) + ((y - 1)/400)
        
        
        if(((y % 4 == 0) && (y % 100 == 0)) || (y % 400 == 0)){
            monthArray[1] = monthArray[1] + 1
        }
        for i in stride(from: 0, to: m - 1, by: 1) {
            total += monthArray[i]
        }
        total += d
        
        return total
    }
    
    @IBAction func btnAddDone(_ sender: Any) {
        ref = Database.database().reference()
        
        let uidRef = ref.child(uid).child(textName.text!)
        
        let startRef = uidRef.child("start")
        startRef.setValue(textStartDate.text)
        let finishRef = uidRef.child("finish")
        finishRef.setValue(textFinishDate.text)
        let priceRef = uidRef.child("price")
        priceRef.setValue(textPrice.text)
        
        items.append(textName.text!)
        textName.text = ""
        
        startDate.append(textStartDate.text!)
        textStartDate.text = ""
        
        finishDate.append(textFinishDate.text!)
        textFinishDate.text = ""
        dDayCount += 1
        
        price.append(textPrice.text!)
        textPrice.text = ""
        
        done()
        
        _ = navigationController?.popViewController(animated: true)
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
