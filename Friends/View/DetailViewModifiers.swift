//
//  DetailViewModifiers.swift
//  Friends
//
//  Created by Joshan Rai on 4/5/22.
//

import SwiftUI

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.system(size: 9))
                .foregroundColor(.primary)
                .padding(.horizontal, 5)
                .background(.black.opacity(0.35))
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct DetailsInformationView: View {
    let userMetaData: CachedUser
    
    var body: some View {
        Text("Information")
            .font(.title2)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 5, alignment: .leading)
        
        VStack(spacing: 10) {
            HStack(spacing: 20) {
                Text("Name")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text(userMetaData.wrappedName)
                    .foregroundColor(.aluminum)
            }
            HStack(spacing: 20) {
                Text("Company")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text(userMetaData.wrappedCompany)
                    .foregroundColor(.aluminum)
            }
            HStack(spacing: 20) {
                Text("Age")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text("\(userMetaData.age)")
                    .foregroundColor(.aluminum)
            }
        }
        .padding()
    }
}

struct DetailsAboutView: View {
    let userMetaData: CachedUser
    
    var body: some View {
        Text("About")
            .font(.title2)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 5, alignment: .leading)
        
        VStack(spacing: 10) {
            Text(userMetaData.wrappedAbout)
                .foregroundColor(.aluminum)
        }
        .padding()
    }
}

struct DetailsContactView: View {
    let userMetaData: CachedUser
    
    var body: some View {
        Text("Contact")
            .font(.title2)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 5, alignment: .leading)
        
        VStack(spacing: 10) {
            HStack(spacing: 20) {
                Text("Email")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text(userMetaData.wrappedEmail)
                    .foregroundColor(.aluminum)
            }
            HStack(spacing: 20) {
                Text("Address")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text(userMetaData.wrappedAddress)
                    .foregroundColor(.aluminum)
            }
        }
        .padding()
    }
}

struct DetailsOtherView: View {
    let userMetaData: CachedUser
    
    var body: some View {
        Text("Other")
            .font(.title2)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 5, alignment: .leading)
        
        VStack(spacing: 10) {
            HStack(spacing: 20) {
                Text("ID")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text("\(userMetaData.wrappedID)")
                    .foregroundColor(.aluminum)
            }
            HStack(spacing: 20) {
                Text("Registered")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text("\(userMetaData.wrappedRegistered)")
                    .foregroundColor(.aluminum)
            }
        }
        .padding()
    }
}

struct DetailsFriendsListView: View {
    //@ObservedObject var fetcher: UserCollectionFetcher
    let userMetaData: CachedUser
    //var friendMetaData: [Friend]
    
    var body: some View {
        Text("Friends")
            .font(.title2)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 5, alignment: .leading)
        /// I once again can't figure out how to fix this because now it complains too much, so I'll work on a fix later. For now, party because Core Data worked.
        ForEach(userMetaData.friendsArray, id: \.self) { friend in
            NavigationLink(destination: DetailView(userMetaData: userMetaData)) {
                VStack(alignment: .leading) {
                    Text(friend.wrappedName)
                        .accessibilityAddTraits(.isHeader)
                        .font(.headline)
                    Spacer()
                    HStack {
                        Label("\(friend.wrappedID)", systemImage: "number.circle")
                            .accessibilityLabel("ID: \(friend.wrappedID)")
                    }
                    .font(.caption)
                    .foregroundColor(Color.aluminum)
                }
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding()
            }
        }
    }
}

/*
struct DetailsFriendView: View {
    //@ObservedObject var fetcher: UserCollectionFetcher
    let friendMetaData: CachedFriend
    let userMetaData: CachedUser

    var body: some View {
        if let isFriend = find(byID: friendMetaData.wrappedID) {
            return AnyView(DetailsFriendsListView(userMetaData: isFriend))
        } else {
            return AnyView(Text(friendMetaData.wrappedName))
        }
    }
    
    func find(byID: UUID) -> CachedUser? {
        return userMetaData.friendsArray.first?.users
    }
}
 */
