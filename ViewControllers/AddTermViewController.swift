//
//  AddTermViewController.swift
//  SSUSchedulePlanner
//
//  Created by student on 11/28/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit
import CoreData

class AddTermViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // University Light Blue
    let UniversityDarkBlue = UIColor(red: 20/255, green: 59/255, blue: 135/255, alpha: 1.0)
    
    var classes = [Class]()
    
    var terms = [Term]()
    
    var termIndex = Int()
    
    var clickedCell = IndexPath()
    
    @IBOutlet weak var classTable: UITableView!
    
    @IBAction func clickedAddClass(_ sender: Any) {
        print("Clicked Add Class Button")
        
    }
    
    func somthing()
    {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading AddTermViewController")
        print("Term Index: \(termIndex)")
        classes = Array(terms[termIndex].classes!) as! [Class]
        
        classTable.delegate = self
        classTable.dataSource = self
        
        print("Number Of Terms: \(terms.count)")
        print("Number Of Classes: \(classes.count)")
        classTable.reloadData()
        /*
 
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Class> = Class.fetchRequest()
        do
        {
            let classes = try context.fetch(fetchRequest)
            self.classes = classes
            self.classTable.reloadData()
            print("Fetched Classes From CoreData")
        }
        catch
        {
            print("Error in Retrieving Classes")
        }
         */
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Class> = Class.fetchRequest()
        do
        {
            let classes = try context.fetch(fetchRequest)
            self.classes = classes
            self.classTable.reloadData()
            print("Fetched Classes From CoreData")
        }
        catch
        {
            print("Error in Retrieving Classes")
        }
        */
        
        // print("Count of classes: \(classes.count)")
        self.classTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "classTableViewCell", for: indexPath) 
        
            if let theCell = cell as? ClassInsideTermCell {
                
                print("Add Cell")
                
                theCell.className.text = classes[indexPath.row].class_Name
                theCell.classUnits.text = String(classes[indexPath.row].class_Units)
                
                theCell.className.textColor = UIColor.white
                theCell.classUnits.textColor = UIColor.white
                
            }
        
        cell.backgroundColor = UniversityDarkBlue
        
        return(cell)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard segue.identifier == "saveTermSegue" else {
            // AddClassSegue button clicked was Add Class
            let searchClassDestinationVC : searchClassController = segue.destination as! searchClassController
            searchClassDestinationVC.terms = self.terms
            searchClassDestinationVC.termIndex = self.termIndex
            
            return
        }
        
        let destinationVC : CreateScheduleViewController = segue.destination as! CreateScheduleViewController
        destinationVC.terms = self.terms
       // destinationVC.termTable.reloadData()
        
   //     let appDelegate = UIApplication.shared.delegate as! AppDelegate
   //     let context = appDelegate.persistentContainer.viewContext
    //    let term = Term(context: context)
    
        // saveSchedule(destinationVC)
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
