//
//  Student.swift
//  SSUSchedulePlanner
//
//  Created by student on 12/2/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit

class Student: NSObject, Codable{
    override init(){
        fname = ""
        lname = ""
        user_name = ""
        user_icon_url = ""
        token = ""
        super.init()
    }
    var fname: String
    var lname: String
    var user_name: String
    var user_icon_url: String?
    var token: String
}
