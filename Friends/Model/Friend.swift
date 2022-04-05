//
//  Friend.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import Foundation


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

extension Friend {
    static let sampleFriendData: [Friend] =
    [
        Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel"),
        Friend(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6", name: "Jewel Sexton"),
        Friend(id: "be5918a3-8dc2-4f77-947c-7d02f69a58fe", name: "Berger Robertson")
    ]
}
