//
//  ViewController.swift
//  pr_coredata
//
//  Created by Tahlia on 11/10/16.
//  Copyright © 2016 Tahlia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    let cell = UITableViewCell()

    var tasks : [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from coreData
        getData()
        
        //reload the tableview
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellId = "AddTaskTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let task = tasks[indexPath.row]
     //   let AddTaskVC = AddTaskViewController()
        
        if task.isImportant == true {
            cell.textLabel?.text = " ♨️ \(task.name!)"

        }else{
            cell.textLabel?.text = task.name!

        }
        
        return cell
    }

    
    
    func getData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
        tasks = try context.fetch(Task.fetchRequest())
        }catch{
            print("fetching failed")
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
            
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
            tasks = try context.fetch(Task.fetchRequest())
            }catch{
                print ("deleting failed")
            }
        }
        
        tableView.reloadData()
        
    }

    
}








