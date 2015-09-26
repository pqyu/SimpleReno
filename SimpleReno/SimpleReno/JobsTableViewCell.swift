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
    
    func populateCell(job: Job) {
        jobImageView.file = job.photo
        jobImageView.loadInBackground()
        categoryLabel.text = job.category
        descriptionText.text = job.descriptionText
    }
}

//MARK: Private helper methods
private extension JobsTableViewCell {
    
}