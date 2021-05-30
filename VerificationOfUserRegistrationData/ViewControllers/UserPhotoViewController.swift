//
//  UserPhotoViewController.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 28.05.2021.
//

import UIKit

class UserPhotoViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    var photo : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPhotoVC()

      
    }
    private func setupPhotoVC() {
        photoImageView.image = UIImage(named: photo!)
    }


}
