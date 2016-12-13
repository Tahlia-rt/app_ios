//
//  SignUpViewController.swift
//  App-iOS-universal
//
//  Created by Tahlia on 12/13/16.
//  Copyright © 2016 Tahlia. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

  
    @IBAction func createAcountAction(_ sender: Any) {
        
        if emailTextField.hasText == false {
            let alertController = UIAlertController(title: "ERROR", message: "Please write your email address", preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }else{
            
            FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: pwTextField.text!, completion:{ (user, error) in
                if error == nil{
                    print("You have successfully signed up")
                    
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HOME")
//                    self.present(vc!, animated: true, completion: nil)
                    
                    self.performSegue(withIdentifier: "toLogin", sender: self)

                }else{
                    let alertController = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            })
        }
    }
    

    

    /*
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



}
