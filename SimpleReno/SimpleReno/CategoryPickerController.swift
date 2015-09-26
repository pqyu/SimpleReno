//
//  CategoryPickerController.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-26.
//  Copyright © 2015 Noms. All rights reserved.
//

import UIKit

final class CategoryPickerController: UITableViewController {
    @IBOutlet private weak var categoryPicker: UIPickerView!
    weak var delegate: AddJobTableViewController?
}

//MARK: @IBActions
private extension CategoryPickerController {
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        let selectedRow = categoryPicker.selectedRowInComponent(0)
        delegate?.category = categories[selectedRow]
        navigationController?.popViewControllerAnimated(true)
    }
}
//MARK: PickerDataSource
extension CategoryPickerController: UIPickerViewDataSource {
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count //global in Categories.swift... will encapsulate properly if I have time
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
}

//MARK: PickerDelegate
extension CategoryPickerController: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
}