//
//  Job.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-25.
//  Copyright © 2015 Noms. All rights reserved.
//

import Parse


//Each job class represents a job a customer posted for contractors to see. Jobs are classified as one of our pre-defined categories. For instance, as a demo, our list of categories might be Washroom, Kitchen, and DiningRoom.
class Job: PFObject {
    @NSManaged var category: String?
    @NSManaged var comment: String?
    @NSManaged var createdBy: PFUser
    @NSManaged var descriptionText: String? //need to fix at parse backend
    @NSManaged var expiryOn: NSDate
    @NSManaged var photo: PFFile
    @NSManaged var rating: Int
    @NSManaged var status: Int
    @NSManaged var userId: String?
}

extension Job: PFSubclassing {
    class func parseClassName() -> String {
        return "Job"
    }
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: Job.parseClassName())
        return query
    }
}