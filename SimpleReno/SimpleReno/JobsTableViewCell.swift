//
//  JobsTableViewCell.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-25.
//  Copyright © 2015 Noms. All rights reserved.
//

import ParseUI

class JobsTableViewCell: PFTableViewCell {
    @IBOutlet weak var jobImageView: PFImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
}

//MARK: Private helper methods
private extension JobsTableViewCell {
    
}