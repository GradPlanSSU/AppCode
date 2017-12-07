//
//  ClassDescriptionViewController.swift
//  SSUSchedulePlanner
//
//  Created by student on 12/1/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit
import CoreData

class ClassDescriptionViewController: UIViewController {

    //@IBOutlet weak var saveClass: UIBarButtonItem!
    let lightGray = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)
    
    var className = Course()
    
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseUnitsLabel: UILabel!
    @IBOutlet weak var courseGELabel: UILabel!
    @IBOutlet weak var coursePrerequisiteLabel: UILabel!
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    
    
    
    @IBAction func didClickSave(_ sender: Any) {
        if let navController = self.navigationController {
            let viewControllers: [UIViewController] = navController.viewControllers as [UIViewController]
            let prevController: AddTermViewController = viewControllers[viewControllers.count - 4] as! AddTermViewController
            self.saveClass()
            prevController.terms = self.terms
            prevController.termIndex = self.termIndex
            navController.popToViewController(prevController, animated: true)
        }
    }
    
    var clickedCell = IndexPath()
    
    var terms = [Term]()
    var termIndex = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = lightGray
 
        print("Subject to be printed: \(self.className.subject)")
       self.courseNameLabel.text = self.className.subject + " " + self.className.catalog + " " + self.className.course_title
       self.courseUnitsLabel.text = self.className.units
        if self.className.ge_designation?.count == 0 {
            self.courseGELabel.text = "No GE Attribute"
        } else {
             self.courseGELabel.text = self.className.ge_designation
        }
        self.courseDescriptionLabel.text = "N/A"
        
        print(self.className.catalog)
    
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
 //       print("Inside View Did Appear")
        self.courseNameLabel.text = self.className.subject + " " + self.className.catalog + " " + self.className.course_title
        self.courseUnitsLabel.text = self.className.units
        
        
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard segue.identifier == "saveClassSegue" else { return }
        let destinationVC : AddTermViewController = segue.destination as! AddTermViewController
        //self.saveClass(destinationVC)
        destinationVC.terms = self.terms
        destinationVC.termIndex = self.termIndex
       // destinationVC.classTable.reloadData()
        // self.saveClass(destinationVC)
    }

    func saveClass() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let chosenClass = Class(context: context)
        chosenClass.class_Name = courseNameLabel.text
        chosenClass.class_Units = courseUnitsLabel.text
        chosenClass.catalog = self.className.catalog
        chosenClass.subject = self.className.subject
        terms[termIndex].addToClasses(chosenClass)
        
        
        print("terms count: \(terms.count)")
        
        // terms[termIndex].addToClasses(chosenClass)
  
       //  vc.classes.append(chosenClass)
        // vc.classTable.reloadData()
    }
    
   // func updateLabels() {
   //     self.courseNameLabel.text = self.className.course_title
   // }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
