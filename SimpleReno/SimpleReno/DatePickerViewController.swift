//
//  DatePickerViewController.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-26.
//  Copyright © 2015 Noms. All rights reserved.
//

import UIKit

final class DatePickerViewController: UITableViewController {
    @IBOutlet private weak var datePicker: UIDatePicker! {
        didSet {
            datePicker.minimumDate = NSDate()
            let maximumDate = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: 1, toDate: NSDate(), options: [])
            datePicker.maximumDate = maximumDate
        }
    }
}