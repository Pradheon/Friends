//
//  DetailView.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import SwiftUI

struct DetailView: View {
    var userMetaData: User
    var friendMetaData: User.Friend
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ZStack(alignment: .bottomLeading) {
                    Image("monterey_bay")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .watermarked(with: userMetaData.id)
                    
                    ProfileImageView()
                        .offset(x: 15, y: 25)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    DetailsInformationView(userMetaData: userMetaData)
                    
                    HorizontalDivider()
                    
                    DetailsFriendsListView(userMetaData: userMetaData, friendMetaData: friendMetaData)
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle(userMetaData.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(userMetaData: User.sampleUserData[0], friendMetaData: User.Friend.sampleFriendData[0])
            .preferredColorScheme(.dark)
    }
}