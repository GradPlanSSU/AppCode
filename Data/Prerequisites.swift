//
//  Prerequisites.swift
//  SSUSchedulePlanner
//
//  Created by student on 12/6/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import UIKit
struct EnrollmentRequirement {
    var course: String
    var prerequisites: [String]?
    var vari_prerequisites: [[String]]?
    var corequisite: [String]?
}
class Prerequisites: NSObject {
    var courses: [EnrollmentRequirement]
    override init() {
        courses = [EnrollmentRequirement]()
        super.init()
    }
}
