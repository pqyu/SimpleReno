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
        }
    }
}

//MARK: TableViewDelegate
extension JobsTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier(SegueIdentifiers.JobDetailSegue, sender: nil)
    }
}
//MARK: @IBActions
private extension JobsTableViewController {
    
}