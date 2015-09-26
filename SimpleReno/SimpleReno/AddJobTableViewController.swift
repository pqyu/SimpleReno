//
//  AddJobTableViewController.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-25.
//  Copyright © 2015 Noms. All rights reserved.
//

import ParseUI
import UIKit

final class AddJobTableViewController: UITableViewController {
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var jobImageView: UIImageView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var expiryDateLabel: UILabel!
    
}

//MARK: TableViewDelegate
extension AddJobTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

//MARK: @IBActions
private extension AddJobTableViewController {
    @IBAction func locationSwitchFlipped(sender: UISwitch) {
        print("locationSwitchFlipped")
    }
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        
    }
}