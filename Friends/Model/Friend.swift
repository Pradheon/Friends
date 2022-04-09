//
//  Friend.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import Foundation


struct Friend: Identifiable, Codable {
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String) {
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
        Friend(name: "Hawkins Patel"),
        Friend(name: "Jewel Sexton"),
        Friend(name: "Berger Robertson")
    ]
}
