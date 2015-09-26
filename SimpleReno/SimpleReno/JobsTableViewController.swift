//
//  JobsTableViewController.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-25.
//  Copyright © 2015 Noms. All rights reserved.
//

import UIKit
import ParseUI
import Parse

class JobsTableViewController: PFQueryTableViewController {
    private struct SegueIdentifiers {
        static let JobDetailSegue = "JobDetailSegue"
    }

    override func queryForTable() -> PFQuery {
        return Job.query()!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SegueIdentifiers.JobDetailSegue {
            //segue to detail, give it the job
        }
    }
}

//MARK: @IBActions
private extension JobsTableViewController {
    
}