//
//  ViewController.swift
//  HelloWorld
//
//  Created by 문주원 on 2020/06/04.
//  Copyright © 2020 문주원. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lbl: UILabel!
    @IBOutlet var TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        lbl.text = TextField.text
        TextField.text = ""
    }
    

}

