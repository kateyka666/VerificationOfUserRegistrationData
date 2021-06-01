//
//  WelcomeViewController.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 26.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeUserNameLabel: UILabel!
    
    var user = [User]()
    
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
        setupTapBarViewAndLabel()
    }
    
    private func setupTapBarViewAndLabel() {
        view.addverticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        tabBarItem.title = "ДРАТУТИ"

        welcomeUserNameLabel.text = " \(user[0].name), здравствуйте!"
        welcomeUserNameLabel.numberOfLines = 0
    }
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
    
}
