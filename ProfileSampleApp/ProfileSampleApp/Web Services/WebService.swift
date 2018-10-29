//
//  WebService.swift
//  ProfileSampleApp
//
//  Created by Shankar K on 29/10/18.
//  Copyright © 2018 Shankar. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]

class Webservice {
    
    func getProfiles(url :URL, callback :@escaping ([Profile]) -> ()) {
        
        var profiles = [Profile]()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                
                var dictionary = json as! JSONDictionary
                
                let profileDictionaries = dictionary["data"] as! [JSONDictionary]

                profiles = profileDictionaries.compactMap { dictionary in
                    return Profile(dictionary :dictionary)
                }
                DispatchQueue.main.async {
                    callback(profiles)
                }

            }
            
            
            }.resume()
        
    }
    
}
