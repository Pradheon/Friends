//
//  ContentView.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import SwiftUI

enum FetchError: Error {
    case badRequest
    case badJSON
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    //@EnvironmentObject var fetcher: UserCollectionFetcher
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users: FetchedResults<CachedUser>

    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink(destination: DetailView(userMetaData: user)) {
                    CardView(userMetaData: user)
                }
            }
        }
        .task {
            try? await fetchData()
        }
        .navigationTitle("Users")
    }
    
    //  MARK: Data Handler Functions Below
    @available(iOS 15.0, *)
    func fetchData() async
    throws {
        let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: urlString) else { return }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let users = try decoder.decode([User].self, from: data)
        //let friends = try decoder.decode([Friend].self, from: data)
        await MainActor.run {
            updateCache(with: users)
        }
    }
    
    //  Cached Users
    func updateCache(with downloadedUsers: [User]) {
        for user in downloadedUsers {
            let cachedUser = CachedUser(context: moc)
            
            cachedUser.id = user.id
            cachedUser.isActive = user.isActive
            cachedUser.name = user.name
            cachedUser.age = Int16(user.age)
            cachedUser.company = user.company
            cachedUser.email = user.email
            cachedUser.address = user.address
            cachedUser.about = user.about
            cachedUser.registered = user.registered
            
            for friend in user.friends {
                let cachedFriend = CachedFriend(context: moc)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                
                cachedUser.addToFriends(cachedFriend)
            }
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                //.environmentObject(UserCollectionFetcher())
        }
    }
}
