//
//  DataManager.swift
//  moovelCodingExercise
//
//  Created by Sanjay Shrestha on 5/28/17.
//  Copyright © 2017 Sanjay Shrestha. All rights reserved.
//

import Foundation

typealias jsonDict = [String: Any]

struct DataManager {
    
    //MARK: Get JSON info
    static func getRiderInfo(url: String, completion: @escaping ([Rider]?) -> ()){
        let request = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: request){
            (riderData : Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.global().async {
                
            if let data = riderData {
                var riders = [Rider]()
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? jsonDict {
                        
                        if let adult = try? Rider(json: json, riderType: "Adult"){
                            riders.append(adult)
                        }
                        if let child = try? Rider(json: json, riderType: "Child"){
                            riders.append(child)
                        }
                        if let senior = try? Rider(json: json, riderType: "Senior"){
                            riders.append(senior)
                        }
                        //Else throw error handling here
                    }
                }catch {
                    print(error.localizedDescription)
                }
                completion(riders)

                
            }
            }
        }
        task.resume()
    
    }

}
