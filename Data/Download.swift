//
//  Download.swift
//  SSUSchedulePlanner
//
//  Created by student on 12/2/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import Foundation

struct DLToken{
    static var token = ""
}

class Download: NSObject {
    var urlString: String
    @objc dynamic var dataFromServer: [AnyObject]?
    
    init(withURLString: String) {
        urlString = withURLString
        super.init()
        
    }
    
    func download_request() {
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)
                
                if let data = contents.data(using: .utf8) {
                    let decoder = JSONDecoder()
                }
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad
        }
    }
}
