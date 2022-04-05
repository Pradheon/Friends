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
    @Published var friends: [User.Friend] = []
    //@Published var registered: String = ""
    @Published var sampleUserData = UserCollection(sample: User.sampleUserData)
    @Published var sampleFriendData = User.FriendCollection(sample: User.Friend.sampleFriendData)
    
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
        
        let dateDecoder = JSONDecoder()
        dateDecoder.dateDecodingStrategy = .iso8601
        
        users = try JSONDecoder().decode([User].self, from: data)
        friends = try JSONDecoder().decode([User.Friend].self, from: data)
        //registered = try dateDecoder.decode(registered.self, from: data)
    }
}
