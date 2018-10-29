//
//  ProfileListViewModel.swift
//  ProfileSampleApp
//
//  Created by Shankar K on 29/10/18.
//  Copyright © 2018 Shankar. All rights reserved.
//

import Foundation


struct ProfileListViewModel {
    
    var title :String? = "Profile"
    var profiles :[ProfileViewModel] = [ProfileViewModel]()
}

extension ProfileListViewModel {
    
    init(profiles :[ProfileViewModel]) {
        self.profiles = profiles
    }
    
}

struct ProfileViewModel {
    
    var id: NSNumber
    var name :String
    var description :String
    var avatarURL: String
}

extension ProfileViewModel {
    
    init(profile : Profile) {
        self.name = profile.name
        self.description = profile.description
        self.avatarURL = profile.avatarURL
        self.id = profile.id
    }
}
