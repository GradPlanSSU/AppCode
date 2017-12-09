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

        if (username?.characters.count)! < 4 || (password?.characters.count)! < 6 {

            print("Invalid Username and/or Password")
            let alertController = UIAlertController(title: "Invalid Username/Password", message: "", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Confirm", style: .default)
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            let login = NetRequestHandler(withURLString: "http://blue.cs.sonoma.edu:8000/authenticate/login").usePostString(postString: "username=" + username! + "&password=" + password!)
            login.post_request_callback() { data in
                do {
                    let student: Student? = try JSONDecoder().decode(Student.self, from: data!)
                    if student != nil {
                        AuthToken.token = student!.token
                        print(AuthToken.token)
                    }
                    OperationQueue.main.addOperation {
                        self.performSegue(withIdentifier: "LoginToMainMenu", sender: self)
                    }
                } catch {
                
                }
            }
            
        }
        // comment this out when you want login page to work
       // performSegue(withIdentifier: "LoginToMainMenu", sender: self)
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameInput.text = ""
        passwordInput.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

