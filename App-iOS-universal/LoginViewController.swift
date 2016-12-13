//
//  LoginViewController.swift
//  App-iOS-universal
//
//  Created by Tahlia on 12/13/16.
//  Copyright © 2016 Tahlia. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func loginAction(_ sender: Any) {
        if emailTextField.hasText == false || pwTextField.hasText == false{
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }else{
            
            FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.pwTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    print("You have successfully logged in")
                    
                   
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoggedIn")
//                    self.present(vc!, animated: true, completion: nil)
                    
            
            
                }else{
                    
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    
                }
            
        }
    }
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
     func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: LoginViewController) {
        
    }

}

    
