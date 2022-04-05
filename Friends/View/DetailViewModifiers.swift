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
    var userMetaData: User
    
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
                Text(userMetaData.name)
                    .foregroundColor(.aluminum)
            }
            HStack(spacing: 20) {
                Text("Company")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text(userMetaData.company)
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

struct DetailsFriendsListView: View {
    var userMetaData: User
    var friendMetaData: [User.Friend]
    
    var body: some View {
        Text("Friends")
            .font(.title2)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 5, alignment: .leading)
        
        List {
            ForEach(friendMetaData) { friend in
                VStack(spacing: 10) {
                    HStack(spacing: 20) {
                        Text("Name")
                            .foregroundColor(.steel)
                            .fontWeight(.bold)
                        Spacer()
                        Text(friend.name)
                            .foregroundColor(.aluminum)
                    }
                    HStack(spacing: 20) {
                        Text("ID")
                            .foregroundColor(.steel)
                            .fontWeight(.bold)
                        Spacer()
                        Text(friend.id)
                            .foregroundColor(.aluminum)
                    }
                }
                .padding()
            }
        }
        
        /*
        VStack(spacing: 10) {
            HStack(spacing: 20) {
                Text("Name")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text(friendMetaData.name)
                    .foregroundColor(.aluminum)
            }
            HStack(spacing: 20) {
                Text("ID")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text(friendMetaData.id)
                    .foregroundColor(.aluminum)
            }
        }
        .padding()
         */
    }
}

struct DetailViewModifiers_Previews: PreviewProvider {
    static var previews: some View {
        DetailsInformationView(userMetaData: User.sampleUserData[0])
    }
}
