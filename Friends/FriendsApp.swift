//
//  FriendsApp.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import SwiftUI

@main
struct FriendsApp: App {
    //@StateObject private var fetcher = UserCollectionFetcher()
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    //.environmentObject(fetcher)
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
