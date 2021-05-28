//
//  UserInfoViewController.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 28.05.2021.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var portretImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    @IBOutlet weak var InstagramBtn: UIButton!
    
    private var user = User.createUsers()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func instagramBtnPressed() {
    }
    
}
