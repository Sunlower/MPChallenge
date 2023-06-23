//
//  TesteRoute.swift
//  MPChallenge
//
//  Created by Marcelo De Araújo on 23/06/23.
//

import SwiftUI

struct CardVinicius: View {

    let title: String
    let action: () -> Void

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(
                        colorScheme == .light
                            ? Color(red: 0.675, green: 0.478, blue: 0.416, opacity: 1)
                            : Color(red: 0.817, green: 0.686, blue: 0.490, opacity: 1)
                    )
                Text(title)
                    .foregroundColor(
                        colorScheme == .light
                            ? (colorScheme == .dark ? .black : .white)
                            : colorScheme == .dark ? .black : .white
                    )
                    .bold()
                    .font(.system(size: 12))
            }
        }
        .frame(
            minWidth: 100,
            idealWidth: 1200,
            maxWidth: .infinity,
            minHeight: 50,
            idealHeight: 50,
            maxHeight: 50,
            alignment: .center
        )
        .contentShape(Rectangle())

    }
}


struct TesteRoute_Previews: PreviewProvider {
    static var previews: some View {
        CardVinicius(title: "Marcelo") {}
    }
}
