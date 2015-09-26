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

//MARK: UITextViewDelegate 
extension AddJobTableViewController: UITextViewDelegate {
    func textViewDidBeginEditing(textView: UITextView) {
        if descriptionTextView.text == "Touch here to edit description" {
            descriptionTextView.text = ""
        }
    }
}
//MARK: TableViewDelegate
extension AddJobTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        view.endEditing(true) //hides all keyboards
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        guard let row = TableViewRows(rawValue: indexPath.row) else { return }
        switch row {
        case .Category:
            performSegueWithIdentifier(SegueIdentifiers.CategorySegue, sender: nil)
        case .Image:
            getPhotoFromImagePicker()
        case .Description:
            descriptionTextView.becomeFirstResponder()
        case .ExpiryDate:
            break
        case .LocationSwitch:
            break
        }
    }
}

//MARK: UIImagePickerControllerDelegate
extension AddJobTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            jobImageView.image = image
        } else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            jobImageView.image = image
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
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

//MARK: Private helper methods
private extension AddJobTableViewController {
    func getPhotoFromImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let alertController = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) { _ in
            imagePicker.sourceType = .Camera
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        let imageLibraryAction = UIAlertAction(title: "Library", style: .Default) { _ in
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        alertController.addAction(cameraAction)
        alertController.addAction(imageLibraryAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}

