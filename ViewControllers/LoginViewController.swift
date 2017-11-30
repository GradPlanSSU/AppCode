//
//  ViewController.swift
//  SSUSchedulePlanner
//
//  Created by Ivan Lim on 11/6/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let UniversityDarkBlue = UIColor(red: 20/255, green: 59/255, blue: 135/255, alpha: 1.0)
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logo: UIImageView!
    
    @IBAction func didTapLogInButton(_ sender: UIButton) {
        
        let username = usernameInput.text
        let password = passwordInput.text
        
        // uncomment this out when you want login page to work
        /*
        if (username?.characters.count)! < 4 || (password?.characters.count)! < 6 {

            print("Invalid Username and/or Password")
            
             let alertController = UIAlertController(title: "Invalid Username/Password", message: "", preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: "Confirm", style: .default)
            
            alertController.addAction(confirmAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            print("username length: \(username?.characters.count)")
            let url = URL(string: "http://blue.cs.sonoma.edu:8000/authenticate/login")!
            var request = URLRequest(url: url)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            let postString = "username=" + username! + "&password=" + password!
            print(postString)
            request.httpBody = postString.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(error!)")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response!)")
                }
                
                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(responseString!)")
            }
            task.resume()
            performSegue(withIdentifier: "LoginToMainMenu", sender: self)
        }
        
        */
        // comment this out when you want login page to work
        performSegue(withIdentifier: "LoginToMainMenu", sender: self)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UniversityDarkBlue
        
        logo.image = UIImage(named: "ssuLogo.jpg")
        
        usernameInput.placeholder = "SSU Username"
        usernameInput.autocorrectionType = UITextAutocorrectionType.no
        
        passwordInput.placeholder = "Password"
        passwordInput.isSecureTextEntry = true
        
        loginButton.backgroundColor = UIColor.white
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.borderWidth = 0
        loginButton.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

