//
//  HorizontalDivider.swift
//  Friends
//
//  Created by Joshan Rai on 4/5/22.
//

import SwiftUI

struct HorizontalDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 0.5)
            .foregroundColor(.lightBackground)
            .padding()
    }
}

struct HorizontalDivider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalDivider()
    }
}
