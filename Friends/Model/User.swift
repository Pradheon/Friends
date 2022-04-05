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
    //var email: String
    //var address: String
    //var about: String
    var registered: String
    //var tags = [Tags]
    var friends: [Friend]
    
    init(id: String, isActive: Bool, name: String, age: Int, company: String, registered: String, friends: [Friend]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.registered = registered
        /// Contextual closure type '(String) throws -> User.Friend' expects 1 argument, but 2 were used in closure body
        //self.friends = friends.map { _ in User.Friend.sampleFriendData[0] }
        self.friends = []
    }
}

struct UserCollection: Codable {
    var sample: [User]
}


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
        var sample: [User.Friend]
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

extension User {
    static let sampleUserData: [User] =
    [
        User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", registered: "2015-11-10T01:47:18-00:00", friends: [User.Friend.sampleFriendData[0]]),
        User(id: "eccdf4b8-c9f6-4eeb-8832-28027eb70155", isActive: true, name: "Gale Dyer", age: 28, company: "Cemention", registered: "2014-07-05T04:25:04-01:00", friends: [User.Friend.sampleFriendData[1]]),
        User(id: "f58db795-dc50-4628-9542-4a0dd07e74c3", isActive: false, name: "Tabitha Humphrey", age: 26, company: "Helixo", registered: "2016-11-01T03:18:33-00:00", friends: [User.Friend.sampleFriendData[2]])
    ]
}
