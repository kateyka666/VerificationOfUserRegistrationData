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
    @IBOutlet weak var songBtn: UIButton!
    
    var user = [User]()
   
    
    private var textLabels = [UILabel]()
    
    private let primaryColor = UIColor(
        red: 109/255,
        green: 168/255,
        blue: CGFloat.random(in: 0...255),
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: CGFloat.random(in: 0...255) ,
        green: 202/255,
        blue: 230/255,
        alpha: 1
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarViewLabelAndButton()
        createImage()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        portretImage.layer.cornerRadius = portretImage.layer.frame.height / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let insta = segue.destination as? InstagramViewController {
                insta.instagram = user[0].instagram
                } else if let userPhoto = segue.destination as? UserPhotoViewController{
                userPhoto.photo = user[1].photo.rawValue
                }
            }

    private func setupNavigationBarViewLabelAndButton() {

        nameLabel.text = "Ваше имя: \(user[0].name)"
        surnameLabel.text = "Ваша фамилия: \(user[0].surname)"
        ageLabel.text = "Ваш возраст: \(user[0].age) 😉"
        jobLabel.text = "Ваша профессия: \(user[0].job) "
        textLabels = [nameLabel, surnameLabel, ageLabel, jobLabel ]
        createFontTextLabels(textLabels: textLabels)
        
        InstagramBtn.setTitle("Ваша инста ТУТЬ💃", for: .normal)
        songBtn.setTitle("Песня про зайцев", for: .normal)
        self.navigationController!.tabBarItem.title = "О ВАС😎"
        
        self.view.addverticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
   
       
    }
    private func createFontTextLabels(textLabels:[UILabel] ) {
        for textLabel in textLabels {
        textLabel.font = UIFont(name: "Helvetica", size: 25)
        }
    }
    
    private func createImage() {
        portretImage.image = UIImage(named: user[0].photo.rawValue)
        portretImage.isHighlighted = true
        portretImage.layer.borderWidth = 8
        portretImage.layer.borderColor = UIColor.purple.cgColor
//        Логическое значение, которое определяет, игнорируются ли пользовательские события и удалены из очереди событий
        portretImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
        gesture.numberOfTapsRequired = 1
        portretImage.addGestureRecognizer(gesture)
    }
    
    @objc private func tapOnImage(gesture:UITapGestureRecognizer) {
        performSegue(withIdentifier: "Rabbit", sender: nil)
    }
    
    @IBAction func instagramBtnPressed() {
        performSegue(withIdentifier: "Istagram", sender: nil)
    }
    @IBAction func songBtnPressed() {
        performSegue(withIdentifier: "Song", sender: nil)
    }
    
    
}
