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
    }
    
    @IBOutlet private weak var jobImageView: UIImageView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var expiryDateLabel: UILabel! {
        didSet {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            guard let date = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: 1, toDate: NSDate(), options: []) else { return }
            expiryDateLabel.text = dateFormatter.stringFromDate(date)
        }
    }
    @IBOutlet private weak var doneBarButton: UIBarButtonItem!
    
    private var userIsUsingKeyboard = false //keeps track of keyboard
    
    var category: String? {
        didSet {
            categoryLabel.text = category
            categoryLabel.textColor = UIColor.blackColor()
            updateDoneButton()
        }
    }
    
    private var image: UIImage? {
        didSet {
            jobImageView.image = image
            updateDoneButton()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SegueIdentifiers.CategorySegue {
            guard let categoryVC = segue.destinationViewController as? CategoryPickerController else { fatalError("Unexpected controller segued. Expected CategoryPickerController") }
            categoryVC.delegate = self
        }
    }
}

//MARK: UITextViewDelegate 
extension AddJobTableViewController: UITextViewDelegate {
    func textViewDidBeginEditing(textView: UITextView) {
        userIsUsingKeyboard = true
        if descriptionTextView.text == "Touch here to edit description" {
            descriptionTextView.text = ""
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if descriptionTextView.text == "" {
            descriptionTextView.text = "Touch here to edit description"
        }
        userIsUsingKeyboard = false
        updateDoneButton()
    }
}

//MARK: TableViewDelegate
extension AddJobTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        guard let row = TableViewRows(rawValue: indexPath.row) else { return }
        switch row {
        case .Category:
            performSegueWithIdentifier(SegueIdentifiers.CategorySegue, sender: nil)
        case .Image:
            if !userIsUsingKeyboard {
                getPhotoFromImagePicker()
            }
        case .Description:
            descriptionTextView.becomeFirstResponder()
        case .ExpiryDate:
            break
        case .LocationSwitch:
            break
        }
        view.endEditing(true) //hides all keyboards
    }
}

//MARK: UIImagePickerControllerDelegate
extension AddJobTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.image = image
        } else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.image = image
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
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) { _ in
            imagePicker.sourceType = .Camera
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        let imageLibraryAction = UIAlertAction(title: "Library", style: .Default) { _ in
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cameraAction)
        alertController.addAction(imageLibraryAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func updateDoneButton() {
        if category != nil && descriptionTextView.text != "Touch here to edit description" && jobImageView.image != nil {
            doneBarButton.enabled = true
        }
    }
}

