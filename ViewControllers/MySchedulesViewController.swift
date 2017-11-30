//
//  MySchedulesViewController.swift
//  SSUSchedulePlanner
//
//  Created by student on 11/7/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit
import CoreData


class MySchedulesViewController: UITableViewController {

    // University Light Blue
    let UniversityDarkBlue = UIColor(red: 20/255, green: 59/255, blue: 135/255, alpha: 1.0)

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var schedules = [Schedule]()

    /*
    let schedule = ["Schedule 1", "Potential Schedule", "Failed all my Classes Schedule"]
    let dates = ["11/5/17", "10/31/17", "10/29/17"]
    let units = ["12","15","11"]
     */
 
    var noDataLabel = UILabel()
    
    var scheduleNameText = String()
    
    var clickedCell = IndexPath()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(schedules.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: "scheduleCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath)
        
        if let theCell = cell as? ScheduleTableViewCell {
            
            theCell.scheduleDate.text = schedules[indexPath.row].scheduleDate
            theCell.scheduleName.text = schedules[indexPath.row].scheduleName
            //theCell.scheduleUnits.text = units[indexPath.row]
            
            theCell.scheduleDate.textColor = UIColor.white
            theCell.scheduleName.textColor = UIColor.white
            theCell.scheduleUnits.textColor = UIColor.white

        }

        cell.backgroundColor = UniversityDarkBlue
        return(cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Schedule> = Schedule.fetchRequest()
        do
        {
            let schedules = try context.fetch(fetchRequest)
            self.schedules = schedules
            self.tableView.reloadData()
            print("Fetched Schedules From CoreData")
        }
        catch
        {
            print("Error in Retrieving Schedules")
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Schedule> = Schedule.fetchRequest()
        do
        {
            let schedules = try context.fetch(fetchRequest)
            self.schedules = schedules
            self.tableView.reloadData()
            print("Fetched Schedules From CoreData")
        }
        catch
        {
            print("Error in Retrieving Schedules")
        }
        
        if schedules.count == 0 {
            noDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text          = "No Schedules Created"
            noDataLabel.textColor     = UIColor.black
            noDataLabel.textAlignment = .center
            tableView.backgroundView  = noDataLabel
            tableView.separatorStyle  = .none
        }
        else {
            noDataLabel.isHidden = true
            tableView.separatorStyle = .singleLine
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // depending on the cell clicked, return the proper schedule
        guard segue.identifier == "SchedulesToDetailed" else {return}
        
        clickedCell = self.tableView.indexPathForSelectedRow!
        let selectedRow = clickedCell.row
        
        print(selectedRow)
        
        // pass schedule object instead 
        let destinationVC : MySchedulesDetailedViewController = segue.destination as! MySchedulesDetailedViewController
       // destinationVC.schedule = self.schedules[selectedRow]
        destinationVC.title = self.schedules[selectedRow].scheduleName
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.clickedCell = indexPath
        print(clickedCell)
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
