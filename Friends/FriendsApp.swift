//
//  FriendsApp.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import SwiftUI

@main
struct FriendsApp: App {
    @StateObject private var fetcher = UserCollectionFetcher()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(friendMetaData: [User.Friend]())
                    .environmentObject(fetcher)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
