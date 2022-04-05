//
//  ContentView.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var fetcher: UserCollectionFetcher
    var friendMetaData: [User.Friend]

    var body: some View {
        List {
            ForEach(fetcher.users) { user in
                NavigationLink(destination: DetailView(userMetaData: user, friendMetaData: friendMetaData)) {
                    CardView(userMetaData: user)
                }
            }
        }
        .task {
            try? await fetcher.fetchData()
        }
        .navigationTitle("Users")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(friendMetaData: [User.Friend]())
                .environmentObject(UserCollectionFetcher())
        }
    }
}
