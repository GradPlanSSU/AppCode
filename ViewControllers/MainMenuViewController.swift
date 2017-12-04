//
//  MainMenuViewController.swift
//  SSUSchedulePlanner
//
//  Created by Ivan Lim on 11/6/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit
import CollapsibleTableSectionViewController

class MainMenuViewController: UIViewController {

    @IBOutlet weak var CreateScheduleButton: UIButton!
    @IBOutlet weak var MySchedulesButton: UIButton!
    @IBOutlet weak var ARRButton: UIButton!
    
    // University Light Blue
    let UniversityDarkBlue = UIColor(red: 20/255, green: 59/255, blue: 135/255, alpha: 1.0)
    
    @IBAction func didTapCreateScheduleButton(_ sender: UIButton) {
        print("Clicked Create Schedule")
    }
    @IBAction func didTapMySchedulesButton(_ sender: UIButton) {
        print("Clicked My Schedules")
    }
   @IBAction func didTapARRButton(_ sender: UIButton) {
        print("Clicked Academic Requirements Report")
    }
    
    @IBAction func didTapLogoutButton(_ sender: UIBarButtonItem) {
        print("Clicked Logout Button")
        presentingViewController?.dismiss(animated: true, completion: nil )
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UniversityDarkBlue
        
        ARRButton.backgroundColor = UIColor.white
        ARRButton.layer.borderColor = UIColor.white.cgColor
        ARRButton.layer.borderWidth = 0
        ARRButton.layer.cornerRadius = 9
       // ARRButton.alpha = 0.70
        
        // ARRButton.setImage(#imageLiteral(resourceName: "ssuLogo.jpg"), for: .normal)
        
        MySchedulesButton.backgroundColor = UIColor.white
        MySchedulesButton.layer.borderColor = UIColor.white.cgColor
        MySchedulesButton.layer.borderWidth = 0
        MySchedulesButton.layer.cornerRadius = 9
       // MySchedulesButton.alpha = 0.70
        
        CreateScheduleButton.backgroundColor = UIColor.white
        CreateScheduleButton.layer.borderColor = UIColor.white.cgColor
        CreateScheduleButton.layer.borderWidth = 0
        CreateScheduleButton.layer.cornerRadius = 9
        
        var download = Download(withURLString: "http://blue.cs.sonoma.edu:8000/courses/catalog").useParams().useToken()
        CourseList.courses = download.download_request()
       // CreateScheduleButton.alpha = 0.70
 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
