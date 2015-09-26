//
//  JobDetailViewController.swift
//  SimpleReno
//
//  Created by Kelvin on 2015-09-25.
//  Copyright © 2015 Noms. All rights reserved.
//

import UIKit

final class JobDetailViewController: UITableViewController {
    @IBOutlet private weak var jobTitleLabel: UILabel!
    @IBOutlet private weak var jobPhotoImageView: UIImageView!
    @IBOutlet private weak var descriptionTextLabel: UILabel!
    private let firstCellHeight: CGFloat = 403.0 //this var holds the value of first cell's height. Same as the height declared in the storyboard. This var is only used in the TableViewDelegate's heightFoRowAtIndexPath method. See the method for more details on how it is used.
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: TableViewDelegate
extension JobDetailViewController {
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        /** The height of the **FIRST** cell is determined by the 3 UI elements
        * jobTitleLabel - this height is held constant
        * jobPhotoImageView - this height is held constant
        * descriptionTextLabel - this height is based on how much text is attached to the description of the job. Since some jobs can have long descriptions, you will adjust the **FIRST** cell's height based on the amount of text the job description has
        */
        if indexPath.row == 0 {
            guard let font = UIFont(name: "Helvetica Neue", size: 17) else { fatalError("Somehow, the Helvetica Neue font could not be constructed") }
            guard let labelHeight = descriptionTextLabel.text?.heightForString(font, width: descriptionTextLabel.frame.width) else {
                //could not determine labelHeight because there was no text. Just return the firstCellHeight and hope for the best.
                return firstCellHeight
            }
            return firstCellHeight + labelHeight
        }
        
        //all other cells have a cell height of 44
        let regularCellHeight: CGFloat = 44
        return regularCellHeight
    }
}

//MARK: @IBActions 
private extension JobDetailViewController {
    @IBAction func editButtonPressed(sender: UIBarButtonItem) {
        descriptionTextLabel.text = "asdlfja;sldfja;lksdf;lkasdf;laksdf;lkasdf;lkasdf;klasdf;lkasdf;lkasd;flasd;fklas;dlkfja;lsdkfj;alsdkjf;alskdjf;laskdjf;lakjsdf;lakjsdf;lkajsdf;lkajsdf;lkjasdf;lkjasdg;lkjasdg;lkjasdf;lkjasd;lfkja;sdlfkja;slkdjg;aweijf;oiawejf;aowie fg;oiawe fd;oaiwj ef;oiaw jef;oij aw;efoij awe;oifj a;woeifjjf;oaw ef;oiawje f;oajwief ;oiawf ;oiewaf" + descriptionTextLabel.text!
        tableView.reloadData()
    }
}