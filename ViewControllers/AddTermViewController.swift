//
//  AddTermViewController.swift
//  SSUSchedulePlanner
//
//  Created by student on 11/28/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit

class AddTermViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // University Light Blue
    let UniversityDarkBlue = UIColor(red: 20/255, green: 59/255, blue: 135/255, alpha: 1.0)
    
    var classes = [Class]()
    
    var clickedCell = IndexPath()
    
    @IBOutlet weak var classTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.classTable.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classTableViewCell", for: indexPath as IndexPath)
        
        if classes.count > 0 {
            if let theCell = cell as? ClassTableViewCell {
                
                
               // theCell.term.text = terms[indexPath.row].termName
              //  theCell.numberOfUnits.text = String(terms[indexPath.row].termUnits)
                
             //   theCell.term.textColor = UIColor.white
            //    theCell.numberOfUnits.textColor = UIColor.white
                
            }
        }
        
        cell.backgroundColor = UniversityDarkBlue
        
        return(cell)
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
