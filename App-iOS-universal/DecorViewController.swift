//
//  DecorViewController.swift
//  App-iOS-universal
//
//  Created by Tahlia on 12/8/16.
//  Copyright © 2016 Tahlia. All rights reserved.
//

import UIKit

class DataEntryField: UITextField, Jitterable{
    
}

class Btn: UIButton, Jitterable{
    
}

class FlashingLabel: UILabel, Flashable, Jitterable{
    
}


class DecorViewController: UIViewController {

    
    @IBOutlet weak var nameField: DataEntryField!
    @IBOutlet weak var emptyField: DataEntryField!
    
    @IBOutlet weak var tadada: FlashingLabel!
    @IBOutlet weak var btn: Btn!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnAct(_ sender: Any) {
        nameField.jitter()
        emptyField.jitter()
        btn.jitter()
        tadada.flash()
        
    }

    



}
