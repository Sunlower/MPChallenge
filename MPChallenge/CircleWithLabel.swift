//
//  CircleWithLabel.swift
//  MPChallenge
//
//  Created by Marcelo De Araújo on 22/06/23.
//

import SwiftUI

struct CircleWithLabel: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack(spacing: 14) {
            Circle()
                .foregroundColor(
                    colorScheme == .dark
                    ? (colorScheme == .dark ? .white : .black)
                    : colorScheme == .dark ? .white : .black
                )
                .frame(width: 12, height: 12)

            Text("Seu Local")
                .foregroundColor(
                    colorScheme == .dark
                    ? (colorScheme == .dark ? .white : .black)
                    : colorScheme == .dark ? .white : .black
                )
                .font(.system(size: 16))
        }
        //        .clipShape(Rectangle())
    }
}

struct CircleWithLabel_Previews: PreviewProvider {
    static var previews: some View {
        CircleWithLabel()
    }
}
