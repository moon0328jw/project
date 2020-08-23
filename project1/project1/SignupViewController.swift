//
//  SignupViewController.swift
//  project1
//
//  Created by 문주원 on 2020/06/10.
//  Copyright © 2020 문주원. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

    var ref = Database.database().reference()
    
    @IBOutlet var nameRegisterText: UITextField!
    @IBOutlet var idRegisterText: UITextField!
    @IBOutlet var pwdRegisterText: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonTouched(_ sender: Any) {
       Auth.auth().createUser(withEmail: idRegisterText.text!, password: pwdRegisterText.text!
                ) { authResult, error in
                    if authResult != nil{
                        print("register success")
                        let uid: String = (Auth.auth().currentUser?.uid)!
                        let userNameText: String = self.nameRegisterText.text!
                        let uidRef = self.ref.child(uid)

                        let userNameRef = uidRef.child("userName")
                        userNameRef.setValue(userNameText)
                    }
                    else{
                        print(self.nameRegisterText.text!)
                        print(self.idRegisterText.text!)
                        print(self.pwdRegisterText.text!)
                        print(authResult)
                        print("register failed")
                    }
        }
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
