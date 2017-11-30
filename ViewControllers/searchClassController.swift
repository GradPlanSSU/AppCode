//
//  searchClassController.swift
//  SSUSchedulePlanner
//
//  Created by student on 11/25/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit

class searchClassController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

 let UniversityDarkBlue = UIColor(red: 20/255, green: 59/255, blue: 135/255, alpha: 1.0)
    
    @IBOutlet weak var subjectText: UITextField!
    @IBOutlet weak var subjectDropDown: UIPickerView!
    
    @IBOutlet weak var courseNumberText: UITextField!
    @IBOutlet weak var courseNumberDropDown: UIPickerView!
    
    var subject = ["AMCS", "CS", "MATH"]
    var courseNumber = ["Less Than", "Exactly", "Greater Than"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subjectDropDown.isHidden = true
        courseNumberDropDown.isHidden = true
        
        subjectDropDown.backgroundColor = UniversityDarkBlue
        courseNumberDropDown.backgroundColor = UniversityDarkBlue
    /*
        let bottomColor = UniversityDarkBlue
        let topColor = UIColor.white
        let gradient: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocation: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradient
        gradientLayer.locations = gradientLocation as [NSNumber]
        
        gradientLayer.frame = self.view.bounds
        subjectDropDown.layer.insertSublayer(gradientLayer, at: 0)
        */
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = subject.count
        if pickerView == courseNumberDropDown {
            
            countrows = self.courseNumber.count
        }
        
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == subjectDropDown {
            
            let titleRow = subject[row]
            
            return titleRow
            
        }
            
        else if pickerView == courseNumberDropDown{
            let titleRow = courseNumber[row]
            
            return titleRow
        }
        
        return ""
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if pickerView == subjectDropDown {
            self.subjectText.text = self.subject[row]
            self.subjectDropDown.isHidden = true
        }
            
        else if pickerView == courseNumberDropDown{
            self.courseNumberText.text = self.courseNumber[row]
            self.courseNumberDropDown.isHidden = true
            
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        if (textField == self.subjectText){
            self.subjectDropDown.isHidden = false
            
        }
        else if (textField == self.courseNumberText){
            self.courseNumberDropDown.isHidden = false
            
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var titleData = subject[row]
        
        if pickerView == courseNumberDropDown {
            titleData = courseNumber[row]
            subjectDropDown.isHidden = false
        }
        else {
            courseNumberDropDown.isHidden = true
        }
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 15.0)!,NSAttributedStringKey.foregroundColor:UIColor.white])
        
        return myTitle
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
