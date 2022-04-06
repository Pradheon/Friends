//
//  DetailView.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var fetcher: UserCollectionFetcher
    var userMetaData: User
    //var friendMetaData: [Friend]
    
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
                    
                    DetailsAboutView(userMetaData: userMetaData)
                    
                    HorizontalDivider()
                    
                    DetailsContactView(userMetaData: userMetaData)
                    
                    HorizontalDivider()
                    
                    DetailsOtherView(userMetaData: userMetaData)
                    
                    HorizontalDivider()
                    
                    Text("Information")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 5, alignment: .leading)
                    ForEach(userMetaData.friends) { friend in
                        DetailsFriendView(fetcher: fetcher, friendMetaData: friend)
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle(userMetaData.name)
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
