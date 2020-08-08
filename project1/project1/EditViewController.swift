//
//  EditViewController.swift
//  project1
//
//  Created by 문주원 on 2020/06/08.
//  Copyright © 2020 문주원. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet var lblText: UILabel!
    @IBOutlet var editText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func EditingEnd(_ sender: Any) {
        lblText.text = editText.text
        editText.text = ""
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
