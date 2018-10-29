//
//  Common.swift
//  ProfileSampleApp
//
//  Created by Shankar K on 29/10/18.
//  Copyright © 2018 Shankar. All rights reserved.
//

import Foundation
import UIKit
import Reachability

struct Common {
    // MARK: - Storyboards
    struct Storyboards {
        static let MainStoryboard = "Main"
    }
    
    // MARK: - Cell Identifier
    struct CellIdentifier {
        static let searchCell = "ProfileCell"
    }
    
}

extension UIViewController {
    
    func iPhoneScreenSizes(){
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0:
            print("iPhone 3,4")
        case 568.0:
            print("iPhone 5")
        case 667.0:
            print("iPhone 6")
        case 736.0:
            print("iPhone 6+")
            
        default:
            print("not an iPhone")
            
        }
        
    }

    func checkForConnection() -> Bool
    {
        let reachability = Reachability()!
        switch reachability.connection {
        case .cellular,.wifi:
            return true
        case .none:
            return false
        }
    }


}
