//
//  UserDetailViewController.swift
//  JFCardSelectionViewControllerExmaple
//
//  Created by Jeremy Fox on 3/13/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var user: User?
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityStZipLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let _user = user else { fatalError("No user to display.") }
        bgImageView.backgroundColor = UIColor.blackColor()
        titleLabel.text = _user.name
        addressLabel.text = _user.detailTextLineOne
        cityStZipLabel.text = _user.detailTextLineTwo
    }

    @IBAction func callButtonAction(sender: AnyObject) {
        print("Call Button Action!")
    }
    
    @IBAction func emailButtonAction(sender: AnyObject) {
        print("Email Button Action!")
    }
}
