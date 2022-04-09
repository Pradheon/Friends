//
//  User.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    //var tags = [Tags]
    let friends: [Friend]
    
    init(id: UUID = UUID(), isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: Date = Date(), friends: [Friend]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.friends = []
    }
    
    var dateString: String {
        get {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            let date = formatter.string(from: registered)
            return date
        }
    }
}

struct UserCollection: Codable {
    var sample: [User]
}


extension User {
    static let sampleUserData: [User] =
    [
        User(id: UUID(), isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), friends: Friend.sampleFriendData),
        User(id: UUID(), isActive: true, name: "Gale Dyer", age: 28, company: "Cemention", email: "galedyer@cemention.com", address: "652 Gatling Place, Kieler, Arizona, 1705", about: "Laboris ut dolore ullamco officia mollit reprehenderit qui eiusmod anim cillum qui ipsum esse reprehenderit. Deserunt quis consequat ut ex officia aliqua nostrud fugiat Lorem voluptate sunt consequat. Sint exercitation Lorem irure aliquip duis eiusmod enim. Excepteur non deserunt id eiusmod quis ipsum et consequat proident nulla cupidatat tempor aute. Aliquip amet in ut ad ullamco. Eiusmod anim anim officia magna qui exercitation incididunt eu eiusmod irure officia aute enim.", registered: Date(), friends: Friend.sampleFriendData),
        User(id: UUID(), isActive: false, name: "Tabitha Humphrey", age: 26, company: "Helixo", email: "tabithahumphrey@helixo.com", address: "581 Montrose Avenue, Why, Georgia, 5385", about: "Dolor excepteur quis nisi aliquip irure aute aliqua tempor consectetur occaecat cillum elit cillum minim. Ut id eiusmod excepteur officia mollit fugiat tempor ex. Labore cupidatat aliquip esse nisi deserunt duis pariatur dolor ut est nulla veniam mollit. Sint laboris eiusmod laborum proident aliquip duis sint amet. Ad eiusmod minim adipisicing proident irure irure. Labore consequat mollit consequat ad duis enim veniam amet. Ea pariatur velit dolor ut est nostrud nulla ullamco dolor.", registered: Date(), friends: Friend.sampleFriendData)
    ]
}
