//
//  Profile.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-25.
//  Copyright © 2015 Noms. All rights reserved.
//

import Parse

class Profile: PFObject {
    @NSManaged var averageRating: Double
    
    //the following 4 fields are the different categories that contractors can subscribe for notifications for (posted jobs)
    @NSManaged var familyRoom: Bool
    @NSManaged var kitchen: Bool
    @NSManaged var livingRoom: Bool
    @NSManaged var washroom: Bool

    @NSManaged var numJobs: Int
    @NSManaged var phone: String
    @NSManaged var photo: PFFile
    @NSManaged var shareLocation: Bool
}

extension Profile: PFSubclassing {
    class func parseClassName() -> String {
        return "Profile"
    }
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: Profile.parseClassName())
        return query
    }
}