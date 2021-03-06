//
//  AddClassViewController.swift
//  SSUSchedulePlanner
//
//  Created by student on 12/1/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit

class AddClassViewController: UITableViewController {

    let UniversityDarkBlue = UIColor(red: 20/255, green: 59/255, blue: 135/255, alpha: 1.0)
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var classes = [Class]()
    
    var filteredCourses = [Course]()
    var allCourses = [Course]()
    
    var selectedCourse = Course()
    var has_prereq = Bool()
    
    var terms = [Term]()
    var termIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.has_prereq = false
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        filteredCourses = filteredCourses.sorted { $0.catalog < $1.catalog }
     //   filteredCourses = filteredCourses.sorted { $0.catalog > 
        
        if self.allCourses.count > 0 {
            for i in 0...self.allCourses.count - 1 {
                let course = Class(context:context)
                course.class_Name = allCourses[i].course_title
                course.catalog = allCourses[i].catalog
                course.subject = allCourses[i].subject
                course.class_Units = allCourses[i].units
                classes.append(course)
            }
        }
        
        // classes = classes.sorted { $0.catalog! < $1.catalog!}
      
       
     
        self.tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewDidAppear(_ animated: Bool) {
        has_prereq = false
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return classes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultsViewCell", for: indexPath as IndexPath)
        
        if classes.count > 0 {
            
            if let theCell = cell as? SearchResultsTableViewCell {
                
                theCell.courseName.text = classes[indexPath.row].subject! + " " + classes[indexPath.row].catalog! + " " + classes[indexPath.row].class_Name!
                
                theCell.courseUnits.text = classes[indexPath.row].class_Units
                
                theCell.courseName.textColor = UIColor.white
                theCell.courseUnits.textColor = UIColor.white
                
            }
        }
        
        cell.backgroundColor = UniversityDarkBlue
        return(cell)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "courseToDescriptionSegue" else { return }

        let delay = DispatchTime(uptimeNanoseconds: 1000)
        
        DispatchQueue.main.asyncAfter(deadline: delay) {
            let destinationVC : ClassDescriptionViewController = segue.destination as! ClassDescriptionViewController
            print("Preparing for Segue")
            destinationVC.has_prerequisite = self.has_prereq
            destinationVC.title = self.selectedCourse.subject + " " + self.selectedCourse.catalog
            destinationVC.className = self.selectedCourse
            destinationVC.terms = self.terms
            destinationVC.termIndex = self.termIndex
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Inside didSelectRowAt")
        selectedCourse = allCourses[indexPath.row]
        selectedCourse.course_title = allCourses[indexPath.row].course_title
        selectedCourse.catalog = allCourses[indexPath.row].catalog
        selectedCourse.units = allCourses[indexPath.row].units
        
        if !filteredCourses.contains(allCourses[indexPath.row]) {
            self.has_prereq = true
        }
        
        print("Ending didSelectRowAt")
    //    self.performSegue(withIdentifier: "courseToDescriptionSegue", sender: indexPath);
       
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
