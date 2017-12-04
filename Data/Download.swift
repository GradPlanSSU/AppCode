//
//  Download.swift
//  SSUSchedulePlanner
//
//  Created by student on 12/2/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import Foundation

struct DLToken{
    static var token: String = ""
}
struct CourseList{
    //static var courses: Courses? = Courses()
}

class Download: NSObject {
    var urlString: String
    
    init(withURLString: String) {
        urlString = withURLString
        super.init()
        
    }
    func useParams() -> Download {
        urlString = urlString + "?"
        return self
    }
    func useToken() -> Download{
        urlString = urlString + "token=" + DLToken.token
        return self
    }
    func download_request<T: Codable>() -> T?{
        //if let url = URL(string: urlString) {
            //do {
                //let contents = try String(contentsOf: url)
                
                //if let data = contents.data(using: .utf8) {
                    //return try JSONDecoder().decode(T.self, from: data)
                //} else {
                    //return nil
                //}
                
            //} catch {
                // contents could not be loaded
                //print("Could not load contents of URL")
                //return nil
            //}
        //} else {
            // the URL was bad
            //print("URL not properly formatted or does not exist")
            //return nil
        }
    }
}
