//
//  User.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    //var tags = [Tags]
    var friends: [Friend]
    
    init(id: String, isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: Date = Date(), friends: [Friend]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        /// Contextual closure type '(String) throws -> User.Friend' expects 1 argument, but 2 were used in closure body
        //self.friends = friends.map { _ in User.Friend.sampleFriendData[0] }
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

/*
extension User {
    struct Friend: Identifiable, Codable {
        var id: String
        var name: String
        
        init(id: String, name: String) {
            self.id = id
            self.name = name
        }
    }

    struct FriendCollection: Codable {
        var sample: [Friend]
    }
}

extension User.Friend {
    static let sampleFriendData: [User.Friend] =
    [
        User.Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel"),
        User.Friend(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6", name: "Jewel Sexton"),
        User.Friend(id: "be5918a3-8dc2-4f77-947c-7d02f69a58fe", name: "Berger Robertson")
    ]
}
 */


extension User {
    static let sampleUserData: [User] =
    [
        User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", friends: Friend.sampleFriendData),
        User(id: "eccdf4b8-c9f6-4eeb-8832-28027eb70155", isActive: true, name: "Gale Dyer", age: 28, company: "Cemention", email: "galedyer@cemention.com", address: "652 Gatling Place, Kieler, Arizona, 1705", about: "Laboris ut dolore ullamco officia mollit reprehenderit qui eiusmod anim cillum qui ipsum esse reprehenderit. Deserunt quis consequat ut ex officia aliqua nostrud fugiat Lorem voluptate sunt consequat. Sint exercitation Lorem irure aliquip duis eiusmod enim. Excepteur non deserunt id eiusmod quis ipsum et consequat proident nulla cupidatat tempor aute. Aliquip amet in ut ad ullamco. Eiusmod anim anim officia magna qui exercitation incididunt eu eiusmod irure officia aute enim.", friends: Friend.sampleFriendData),
        User(id: "f58db795-dc50-4628-9542-4a0dd07e74c3", isActive: false, name: "Tabitha Humphrey", age: 26, company: "Helixo", email: "tabithahumphrey@helixo.com", address: "581 Montrose Avenue, Why, Georgia, 5385", about: "Dolor excepteur quis nisi aliquip irure aute aliqua tempor consectetur occaecat cillum elit cillum minim. Ut id eiusmod excepteur officia mollit fugiat tempor ex. Labore cupidatat aliquip esse nisi deserunt duis pariatur dolor ut est nulla veniam mollit. Sint laboris eiusmod laborum proident aliquip duis sint amet. Ad eiusmod minim adipisicing proident irure irure. Labore consequat mollit consequat ad duis enim veniam amet. Ea pariatur velit dolor ut est nostrud nulla ullamco dolor.", friends: Friend.sampleFriendData)
    ]
}
