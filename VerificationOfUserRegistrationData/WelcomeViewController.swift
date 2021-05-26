//
//  WelcomeViewController.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 26.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeUserNameLabel: UILabel!

    var userName : String?
    
    var loginVC = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        welcomeUserNameLabel.numberOfLines = 0
        
        addUserName()
        
    }
    private func addUserName() {
        welcomeUserNameLabel.text = " \(userName!), здравствуйте!"
    }
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
    
}
