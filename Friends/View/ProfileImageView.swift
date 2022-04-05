//
//  ProfileImageView.swift
//  Friends
//
//  Created by Joshan Rai on 4/5/22.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        Image("macos_monterey")
            .resizable()
            .frame(width: 150, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.steel, radius: 3, x: 5, y: 5)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
            .previewLayout(.fixed(width: 150, height: 200))
    }
}
