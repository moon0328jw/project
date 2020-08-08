//
//  LogoutViewController.swift
//  project1
//
//  Created by 문주원 on 2020/06/16.
//  Copyright © 2020 문주원. All rights reserved.
//

import UIKit
import Firebase

class LogoutViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var idLbl: UILabel!
    
    let uid: String = Auth.auth().currentUser!.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        print(uid)
        ref.child(uid).child("userName").observeSingleEvent(of: .value) { snapshot in
            let value = snapshot.value as? String ?? "errorValue"
            
            self.nameLbl.text = value
            self.idLbl.text = Auth.auth().currentUser?.email
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickLogoutBtn(_ sender: Any) {
        do {
            try Auth.auth().signOut()
          } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
          }
        self.dismiss(animated: true, completion: nil)
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
