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
    @IBOutlet private weak var jobImageView: UIImageView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var expiryDateLabel: UILabel!
    
    private var descriptionTextViewHeight: CGFloat = 0 {
        didSet {
            
        }
    }
}

//MARK: TableViewDelegate
extension AddJobTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let defaultCellHeight: CGFloat = 44
        switch indexPath.row {
        case TableViewRows.Category.rawValue:
            break
        case TableViewRows.Image.rawValue:
            break
        case TableViewRows.Description.rawValue:
            return 80 + descriptionTextViewHeight
        case TableViewRows.ExpiryDate.rawValue:
            break
        case TableViewRows.LocationSwitch.rawValue:
            break
        default:
            break
        }
        return defaultCellHeight
    }
}

//MARK: UITextViewDelegate
extension AddJobTableViewController: UITextViewDelegate {
    func textViewDidChange(textView: UITextView) {
        let updatedTextViewHeight = descriptionTextView.frame.height
        if descriptionTextViewHeight != updatedTextViewHeight {
            descriptionTextViewHeight = updatedTextViewHeight
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        guard let text = descriptionTextView.text else {
            //no text
            return
        }
        guard let font = UIFont(name: "Helvetica Neue", size: 17) else { fatalError("could not instantiate Helvetica Neue font") }
        let textHeight = text.heightForString(font, width: descriptionTextView.frame.width)
        descriptionTextView.frame.size.height = textHeight
        
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