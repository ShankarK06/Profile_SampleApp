//
//  Profile.swift
//  ProfileSampleApp
//
//  Created by Shankar K on 29/10/18.
//  Copyright © 2018 Shankar. All rights reserved.
//

import Foundation

class Profile {
    
    var id: NSNumber
    var name: String
    var description: String
    var avatarURL: String
    
    init(name :String, description :String, avatarUrl :String, selfid: NSNumber) {
        self.id = selfid
        self.name = name
        self.description = description
        self.avatarURL = avatarUrl
    }
    
    init?(dictionary :JSONDictionary) {
        
        guard let name = dictionary["name"] as? String,let description = dictionary["skills"] as? String,let avatarUrl = dictionary["image"] as? String else {
            return nil
        }
        
        self.id = (dictionary["id"] as? NSNumber)!
        self.name = name
        self.description = description
        self.avatarURL = avatarUrl

    }
    
}
