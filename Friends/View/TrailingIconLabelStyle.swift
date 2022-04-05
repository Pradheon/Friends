//
//  TrailingIconLabelStyle.swift
//  Friends
//
//  Created by Joshan Rai on 4/4/22.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}


struct TrailingIconActivityLabel: View {
    var userMetaData: User
    var body: some View {
        HStack {
            Text(userMetaData.isActive ? "Online" : "Offline")
            Image(systemName: "circlebadge.fill")
                .foregroundColor(userMetaData.isActive ? Color.green : Color.red)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(userMetaData.isActive ? "\(userMetaData.name) is Online" : "\(userMetaData.name) is Offline")
    }
}
