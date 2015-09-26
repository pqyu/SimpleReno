//
//  Bid.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-25.
//  Copyright © 2015 Noms. All rights reserved.
//

import Parse

class Bid: PFObject {
    @NSManaged var profileId: String?
    @NSManaged var quote: Int
}

extension Bid: PFSubclassing {
    class func parseClassName() -> String {
        return "Bid"
    }
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: Bid.parseClassName())
        return query
    }
}