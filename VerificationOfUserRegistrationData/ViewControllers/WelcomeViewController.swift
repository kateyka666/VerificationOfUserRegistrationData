//
//  WelcomeViewController.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 26.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeUserNameLabel: UILabel!
    
    private var user = User.createUsers()
    
    private let primaryColor = UIColor(
        red: CGFloat.random(in: 0...255),
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255 ,
        green: CGFloat.random(in: 0...255),
        blue: 230/255,
        alpha: 1
    )

  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewAndLabel()
    }
    private func setupViewAndLabel() {
        view.addverticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        welcomeUserNameLabel.text = " \(user[0].name), здравствуйте!"
        welcomeUserNameLabel.numberOfLines = 0
    }
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
    
}
