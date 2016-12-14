//
//  LoggedInViewController.swift
//  App-iOS-universal
//
//  Created by Tahlia on 12/13/16.
//  Copyright © 2016 Tahlia. All rights reserved.
//

import UIKit
import Firebase

class LoggedInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logOut(_ sender: Any) {
        if FIRAuth.auth()?.currentUser != nil {
            do{
                try FIRAuth.auth()?.signOut()
                
                performSegue(withIdentifier: "toLogin", sender: self)
                
                
//                let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "Login")
//                present(vc, animated: true, completion: nil)
                
            }catch let error as NSError {
                print(error.localizedDescription)
                
            }
        }
        
        
    }
    

}
