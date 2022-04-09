//
//  CardView.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import SwiftUI

struct CardView: View {
    let userMetaData: CachedUser
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(userMetaData.wrappedName)
                .accessibilityAddTraits(.isHeader)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(userMetaData.wrappedCompany)", systemImage: "building.2.crop.circle")
                    .accessibilityLabel("works at \(userMetaData.wrappedCompany)")
                Spacer()
                /*
                Label("\(userMetaData.isActive ? "Online" : "Offline")", systemImage: "circlebadge.fill")
                    .accessibilityLabel("\(userMetaData.name) is currently \(userMetaData.isActive ? "Online" : "Offline")")
                    .labelStyle(.trailingIcon)
                 */
                TrailingIconActivityLabel(userMetaData: userMetaData)
            }
            .font(.caption)
        }
        .padding()
    }
}

/*
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(userMetaData: User.sampleUserData[0])
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
*/
