//
//  ViewController.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 25.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var forgetNameBtn: UIButton!
    @IBOutlet weak var forgetPasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makePropertyForTextField()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        userNameTextField.layer.cornerRadius = 15
        userPasswordTextField.layer.cornerRadius = 15
        forgetNameBtn.layer.cornerRadius = 10
        forgetPasswordBtn.layer.cornerRadius = 10
    }
    
    //    клавиатура скрывается при любом клике за пределами текстового поля, но не на элементах UI
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if checkTextFieldText() {
            guard segue.identifier == "Autorization" else {
                return
            }
            guard let destination = segue.destination as? WelcomeViewController else { return}
            destination.userName = userNameTextField.text
        }
    }
    
    //    создаем функцию для возвращения по unwind segue на этот vc, затем кнопку выхода перетягиваем на экзит в сториборде, в настройках unwind segue задаем идентификатор и отмечаем правильное название метода, всю реализацию метода пишем в этом vc, сначала проверяем что это именно этот unwind segue, потом делаем очистку текстфилдов и добавляем алерт с прощанием
    @IBAction func unwindToLoginViewController(_ unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "LogOut" else {return}
        
        userNameTextField.text = ""
        userPasswordTextField.text = ""
        
        guard let source = unwindSegue.source as? WelcomeViewController else {return}
        doAlertToBtn(title: "До свидания, \(source.userName!) 🌹🌹🌹")
    }
    
    @IBAction func logInBtnPressed(_ sender: UIButton) {
        checkTextFieldText()
    }
    
    @IBAction func forgetBtnPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            doAlertToBtn(title: "Вас зовут: Анастасия")
            
        } else if sender.tag == 2{
            doAlertToBtn(title: "Ваш пароль: кролики")
        }
    }
    
    private func doAlertToBtn (title: String) {
        let alert = UIAlertController(title: title,
                                      message: nil,
                                      preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "Понятненько",
                                        style:.default,
                                        handler: nil
        )
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    private func makePropertyForTextField() {
        userNameTextField.delegate = self
        //        отключаем автокоррекцию для имени
        userNameTextField.autocorrectionType = .no
        userNameTextField.clearButtonMode = .whileEditing
        userNameTextField.returnKeyType = .next
        
        //        скрываем вводимый пароль
        userPasswordTextField.isSecureTextEntry = true
        userPasswordTextField.delegate = self
        userPasswordTextField.clearButtonMode = .whileEditing
        userPasswordTextField.returnKeyType = .done
        
    }
    
    private func checkTextFieldText () -> Bool {
        
        if userNameTextField.text!.isEmpty &&
            userPasswordTextField.text!.isEmpty {
            
            doAlertToBtn(title: "Сначала введите Имя пользователя и Пароль")
            userNameTextField.returnKeyType = .next
            
            return false
            
        } else if userNameTextField.text != "Анастасия" {
            
            doAlertToBtn(title: "Вас зовут: Анастасия")
            userNameTextField.text = "Анастасия"
            
            return false
            
        } else if userPasswordTextField.text != "кролики" {
            
            doAlertToBtn(title: "Ваш пароль: кролики")
            //            если строчку ниже раскомментировать, то почему то при вводе неправильного имени подтсавляется и правильное имя, и пароль, не понятно почему...буду благодарна, если подскажете:)
            //            userPasswordTextField.text = "кролики"
            return false
            
        } else if userNameTextField.text == "Анастасия" &&
                    userPasswordTextField.text == "кролики" {
            
            return true
            
        }
        return false
    }
}


extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        userPasswordTextField.resignFirstResponder()
        return true
    }
}
