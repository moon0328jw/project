//
//  LoginPageViewController.swift
//  project1
//
//  Created by 문주원 on 2020/06/09.
//  Copyright © 2020 문주원. All rights reserved.
//

import UIKit
import Firebase

class LoginPageViewController: UIViewController {
    
    @IBOutlet var idText: UITextField!
    @IBOutlet var pwdText: UITextField!
    @IBOutlet var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        	
        // Do any additional setup after loading the view.
    }
    
    func checkUserLogin() {
        if (Auth.auth().currentUser != nil) {
            guard let goMain = self.storyboard?.instantiateViewController(identifier: "NavigationController") else {return}
            goMain.modalPresentationStyle = .fullScreen
            self.present(goMain, animated: true)
        }
    }
    
    func successPushAlert() {
        if (Auth.auth().currentUser != nil) {
            let alert = UIAlertController(title: "로그인 성공", message: "로그인을 성공했습니다", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (_) in
                self.checkUserLogin()
            }
            alert.addAction(ok)
            self.present(alert, animated: false)
        }
    }
    
    func failPushAlert() {
        if (Auth.auth().currentUser != nil) {
            let alert = UIAlertController(title: "로그인 실패", message: "로그인을 실패했습니다", preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(ok)
            self.present(alert, animated: false)
        }
    }
    
    @IBAction func loginBtnTouched(_ sender: Any) {
        Auth.auth().signIn(withEmail: idText.text!, password: pwdText
            .text!) { (user, error) in
                    if user != nil{
                        print(self.idText.text!)
                        print(self.pwdText.text!)
                        print("login success")
                        self.successPushAlert()
                    }
                    else{
                        print(self.idText.text!)
                        print(self.pwdText.text!)
                        print("login fail")
                        self.failPushAlert()
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
