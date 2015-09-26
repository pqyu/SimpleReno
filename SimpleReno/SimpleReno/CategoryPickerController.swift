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
}

extension CategoryPickerController: UIPickerViewDataSource {
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count //global in Categories.swift... will encapsulate properly if I have time
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
}

extension CategoryPickerController: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
}