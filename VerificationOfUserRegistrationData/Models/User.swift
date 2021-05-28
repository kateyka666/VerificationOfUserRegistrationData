//
//  User.swift
//  VerificationOfUserRegistrationData
//
//  Created by Екатерина Боровкова on 28.05.2021.
//

import Foundation

struct User {
    var name : String
    var surname: String
    var password: String
    var age : Int
    var job : String
    var photo : Photo
    var instagram : String
    
    static func createUsers() -> [User] {
        return [User(name: "Анастасия", surname: "Соколан", password: "кролики", age: 17, job: "IOS Dev", photo: .portret, instagram: "https://www.instagram.com/anastasia_sokolan/"), User(name: "Анастасия", surname: "Соколан", password: "кролики", age: 17, job: "IOS Dev", photo: .rabbit, instagram: "https://www.instagram.com/anastasia_sokolan/")]
    }
}

enum Photo : String {
    case portret = "АнастасияПортрет"
    case rabbit = "АнастасияКролики"
}
