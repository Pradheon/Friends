//
//  DetailView.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import SwiftUI

struct DetailView: View {
    //@ObservedObject var fetcher: UserCollectionFetcher
    let userMetaData: CachedUser
    //var friendMetaData: [Friend]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ZStack(alignment: .bottomLeading) {
                    Image("monterey_bay")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    .watermarked(with: "\(userMetaData.wrappedID)")
                    
                    ProfileImageView()
                        .offset(x: 15, y: 25)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    DetailsInformationView(userMetaData: userMetaData)
                    
                    HorizontalDivider()
                    
                    DetailsAboutView(userMetaData: userMetaData)
                    
                    HorizontalDivider()
                    
                    DetailsContactView(userMetaData: userMetaData)
                    
                    HorizontalDivider()
                    
                    DetailsOtherView(userMetaData: userMetaData)
                    
                    HorizontalDivider()
                    
                    DetailsFriendsListView(userMetaData: userMetaData)
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle(userMetaData.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

/*
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(userMetaData: User.sampleUserData[0], friendMetaData: Friend.sampleFriendData)
            .preferredColorScheme(.dark)
    }
}
*/
