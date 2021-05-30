//
//  InstagramViewController.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 28.05.2021.
//

import UIKit
import WebKit

class InstagramViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var instagramWebView: WKWebView!
    
    var instagram : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewReguest()
        setupTF()
    }
    
    private func setupTF() {
        urlTextField.text = instagram!
        urlTextField.delegate = self
    }
   
    private func webViewReguest(){
       //    преобразуем строку в урл
        let url = URL(string: instagram!)!
       //    создаем запрос
           let request = URLRequest(url: url)
           //    загрузим наш запрос на вебкитвью
        instagramWebView.load(request)
//        помогает при помощи свайпов переходить по страницам
        instagramWebView.allowsBackForwardNavigationGestures = true
        instagramWebView.navigationDelegate = self
    }
    
    @IBAction func backBtnPressed() {
        if instagramWebView.canGoBack {
            instagramWebView.goBack()
        }
    }
    
    @IBAction func forwardBtnPressed() {
        if instagramWebView.canGoForward {
            instagramWebView.goForward()
        }
    }
    
}
extension InstagramViewController : UITextFieldDelegate {
//   метод для того чтобы выполнять запрос по сайту пользователя делаем метод для кнопки ретурн
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        instagramWebView.load(request)
        
        urlTextField.resignFirstResponder()
        
        return true
    }
}

extension InstagramViewController: WKNavigationDelegate {
//    метод для того чтобы изменять значение текстфилда в зависимости от открытой страницы  в интернете, логики включения кнопок назад-вперед для браузера
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        urlTextField.text = instagramWebView.url?.absoluteString
        
        backButton.isEnabled = instagramWebView.canGoBack
        forwardButton.isEnabled = instagramWebView.canGoForward
    }
    
}
