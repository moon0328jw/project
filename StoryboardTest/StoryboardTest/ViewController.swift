//
//  ViewController.swift
//  StoryboardTest
//
//  Created by 문주원 on 2020/06/04.
//  Copyright © 2020 문주원. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextField();
    }
    
    func addTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40.0).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40.0).isActive = true
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 40.0).isActive = true
        textField.placeholder = "Select date"
        textField.borderStyle = .roundedRect
    }
}

