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
    override func queryForTable() -> PFQuery {
        return Job.query()!
    }
}

//MARK: @IBActions
private extension JobsTableViewController {
    
}