//
//  UserCollectionFetcher.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import Foundation

@MainActor
class UserCollectionFetcher: ObservableObject {
    @Published var users: [User] = []
    @Published var friends: [Friend] = []
    //@Published var sampleUserData = UserCollection(sample: User.sampleUserData)
    @Published var sampleFriendData = FriendCollection(sample: Friend.sampleFriendData)
    
    let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    @available(iOS 15.0, *)
    func fetchData() async
    throws {
        guard let url = URL(string: urlString) else { return }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        users = try decoder.decode([User].self, from: data)
        friends = try decoder.decode([Friend].self, from: data)
    }
    
    func find(byID: String) -> User? {
        return users.first { $0.id == byID }
    }
}
