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
    @Binding var userMetaData: User
    
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

struct DetailsAboutView: View {
    @Binding var userMetaData: User
    
    var body: some View {
        Text("About")
            .font(.title2)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 5, alignment: .leading)
        
        VStack(spacing: 10) {
            Text(userMetaData.about)
                .foregroundColor(.aluminum)
        }
        .padding()
    }
}

struct DetailsContactView: View {
    @Binding var userMetaData: User
    
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
                Text(userMetaData.email)
                    .foregroundColor(.aluminum)
            }
            HStack(spacing: 20) {
                Text("Address")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text(userMetaData.address)
                    .foregroundColor(.aluminum)
            }
        }
        .padding()
    }
}

struct DetailsOtherView: View {
    @Binding var userMetaData: User
    
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
                Text(userMetaData.id)
                    .foregroundColor(.aluminum)
            }
            HStack(spacing: 20) {
                Text("Registered")
                    .foregroundColor(.steel)
                    .fontWeight(.bold)
                Spacer()
                Text(userMetaData.dateString)
                    .foregroundColor(.aluminum)
            }
        }
        .padding()
    }
}

struct DetailsFriendsListView: View {
    @Binding var userMetaData: User
    var friendMetaData: [Friend]
    
    var body: some View {
        Text("Information")
            .font(.title2)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 5, alignment: .leading)
        ForEach(friendMetaData) { friend in
            /// There is a bug here where if the user clicks on this it leads back to the same view.
            /// Currently working on a solution but not 100% sure yet how to fix it.
            NavigationLink(destination: DetailView(userMetaData: $userMetaData, friendMetaData: userMetaData.friends)) {
                VStack(alignment: .leading) {
                    Text(friend.name)
                        .accessibilityAddTraits(.isHeader)
                        .font(.headline)
                    Spacer()
                    HStack {
                        Label("\(friend.id)", systemImage: "number.circle")
                            .accessibilityLabel("ID: \(friend.id)")
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
