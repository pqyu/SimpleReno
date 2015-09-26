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
            //should pass the VC the Job to show the details for
        }
    }
}

//MARK: TableViewDataSource methods
extension JobsTableViewController {
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? JobsTableViewCell else { fatalError("unexpected error where tableView couldn't dequeue the cell") }
        guard let jobs = objects as? [Job] else { fatalError("unexpected objects from parse") }
        let job = jobs[indexPath.row]
        cell.populateCell(job)
        return cell
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