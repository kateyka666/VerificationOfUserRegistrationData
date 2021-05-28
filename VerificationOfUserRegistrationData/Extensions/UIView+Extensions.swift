//
//  UIView+Extensions.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 28.05.2021.
//

import Foundation
import UIKit

extension UIView  {
    func addverticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }
}
