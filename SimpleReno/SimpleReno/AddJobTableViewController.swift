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
    private enum TableViewRows: Int {
        case Category = 0
        case Image = 1
        case Description = 2
        case ExpiryDate = 3
        case LocationSwitch = 4
    }
    
    private struct SegueIdentifiers {
        static let CategorySegue = "CategoryPickerSegue"
        static let ExpirySegue = "DatePickerSegue"
    }
    @IBOutlet private weak var jobImageView: UIImageView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var expiryDateLabel: UILabel!
}

//MARK: TableViewDelegate
extension AddJobTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        view.endEditing(true) //hides all keyboards
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        guard let row = TableViewRows(rawValue: indexPath.row) else { return }
        switch row {
        case .Category:
            break
        case .Image:
            break
        case .Description:
            break
        case .ExpiryDate:
            performSegueWithIdentifier(SegueIdentifiers.ExpirySegue, sender: nil)
        case .LocationSwitch:
            break
        }
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