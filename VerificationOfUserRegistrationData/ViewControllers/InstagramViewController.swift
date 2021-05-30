//
//  InstagramViewController.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 28.05.2021.
//

import UIKit
import WebKit

class InstagramViewController: UIViewController {
    
    @IBOutlet weak var instagramWebView: WKWebView!
    
    var instagram : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewReguest()
    }
   
    private func webViewReguest(){
       //    преобразуем строку в урл
        let url = URL(string: instagram!)!
       //    создаем запрос
           let reguest = URLRequest(url: url)
           //    загрузим наш запрос на вебкитвью
        instagramWebView.load(reguest)
    }

}
