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

    @IBOutlet weak var saveClass: UIBarButtonItem!
    
    var clickedCell = IndexPath()
    
    var terms = [Term]()
    var termIndex = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        self.saveClass(destinationVC)
        destinationVC.terms = self.terms
        destinationVC.termIndex = self.termIndex
       // destinationVC.classTable.reloadData()
        // self.saveClass(destinationVC)
        
    }

    func saveClass(_ vc: AddTermViewController) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let chosenClass = Class(context: context)
        terms[termIndex].addToClasses(chosenClass)
        
        chosenClass.class_Name = "CS 210";
        chosenClass.class_Units = 1;
        
        
        print("terms count: \(terms.count)")
        
        // terms[termIndex].addToClasses(chosenClass)
      
        
       //  vc.classes.append(chosenClass)
        // vc.classTable.reloadData()
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
