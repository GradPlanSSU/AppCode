//
//  Download.swift
//  SSUSchedulePlanner
//
//  Created by student on 12/2/17.
//  Copyright © 2017 Ivan Lim. All rights reserved.
//

import Foundation

struct AuthToken{
    static var token: String = ""
}
struct CourseList{
    static var courses: Courses? = Courses()
}

class NetRequestHandler: NSObject {
    var urlString: String
    var postString: String?
    init(withURLString: String) {
        urlString = withURLString
        super.init()

    }
    func useParams() -> NetRequestHandler {
        urlString = urlString + "?"
        return self
    }
    func usePostString(postString: String?) -> NetRequestHandler {
        self.postString = postString
        return self
    }
    func useToken() -> NetRequestHandler{
        urlString = urlString + "token=" + AuthToken.token
        return self
    }
    func download_request<T: Codable>() -> T?{
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)

                if let data = contents.data(using: .utf8) {
                    return try JSONDecoder().decode(T.self, from: data)
                } else {
                    return nil
                }

            } catch {
                // contents could not be loaded
                print("Could not load contents of URL")
                return nil
            }
        } else {
            // the URL was bad
            print("URL not properly formatted or does not exist")
            return nil
        }
    }
    func post_request<T: Codable>() -> T?{
        if let url = URL(string: urlString){
            var request = URLRequest(url: url)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            if postString != nil {
                request.httpBody = postString?.data(using: .utf8)
            }
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                //networking error check
                guard let data = data, error == nil else {
                    print("error=\(error!)")
                    return nil
                }
                //http error check
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response!)")
                }
                return try JSONDecoder().decode(T.self, from: data)
            }
            task.resume()
        } else {
            return nil
        }
    }
    func post_request_callback<T: Codable>(callback: @escaping (Void) -> Void) -> T?{
        if let url = URL(string: urlString){
            var request = URLRequest(url: url)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            if postString != nil {
                request.httpBody = postString?.data(using: .utf8)
            }
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                //networking error check
                guard let data = data, error == nil else {
                    print("error=\(error!)")
                    return nil
                }
                //http error check
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response!)")
                }
                return try JSONDecoder().decode(T.self, from: data)
                callback()
            }
            task.resume()
        } else {
            return nil
        }
    }
}
