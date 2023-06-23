//
//  Dotted.swift
//  MPChallenge
//
//  Created by Marcelo De Araújo on 21/06/23.
//

import SwiftUI

struct DottedCircle: View {

    var dotCount: Int
    var size: CGFloat
    var isFirstCircleLarge: Bool
    var label: String?

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        GeometryReader { _ in
            VStack {
                ForEach(0..<dotCount, id: \.self) { index in
                    Circle()
                        .foregroundColor(
                            index == 0
                                ? (colorScheme == .dark ? .white : .black)
                                : colorScheme == .dark ? .white : .black
                        )
                        .frame(
                            width: index == 0 ? (isFirstCircleLarge ? size * 2 : size) : size,
                            height: index == 0 ? (isFirstCircleLarge ? size * 2 : size) : size
                        )

                }
            }
        }
    }
}

struct PreviewsDottedCirclePreviews: PreviewProvider {
    static var previews: some View {
        DottedCircle(dotCount: 4, size: 6, isFirstCircleLarge: true)
    }
}
