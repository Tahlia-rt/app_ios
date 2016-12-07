//
//  AddTaskViewController.swift
//  pr_coredata
//
//  Created by Tahlia on 12/1/16.
//  Copyright © 2016 Tahlia. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var isImp: UISwitch!
    @IBOutlet weak var fill: UILabel!
    var gotContents : Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnAdd(_ sender: Any) {
        
    //appDelegate.swift의 lazy var persistentContainer호출
 
        //NSManagedObjectContext
        
        
        
        if textField.hasText == false {
            
            gotContents = false
            fill.alpha = CGFloat(1)

            
        } else{
            
            gotContents = true
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

            let task = Task(context: context)
            task.name = textField.text!
            task.isImportant = isImp.isOn
            
            //save the data to coredata
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            //전 뷰로 되돌아감
            navigationController!.popViewController(animated: true)
            
            
            
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

}
