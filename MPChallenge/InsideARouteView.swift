//
//  InsideARouteView.swift
//  MPChallenge
//
//  Created by Marcelo De Araújo on 22/06/23.
//

import SwiftUI

struct InsideARouteView: View {
    var body: some View {

        VStack(alignment: .leading) {
            VStack(alignment: .trailing, spacing: 20) {
                Spacer()
                TLButton(title: "Compartilhar") {}

                MapLocationAndWeatherCard()

                TLButton(title: "Abrir no Mapa") {}
                Spacer()

            }
            .frame(height: 300)
            CircleWithLabel()
                .padding(.leading)
            Spacer()
            ScrollView {
                VStack {
                    ForEach(0 ..< 50) { index in
                        if index % 2 == 0 {
                            DottedCircle(dotCount: 3, size: 6, isFirstCircleLarge: false)
                                .padding(.leading, 19)
//                                .padding(.bottom)
//                                .padding(.top)
                        } else {
                            CardVinicius(title: "Marcelo") {}
                                .padding(.all, 8)
                                .padding(.top)
                        }
                    }
                }
            }
        }
    }
}

struct InsideARouteViewPreviews: PreviewProvider {
    static var previews: some View {
        InsideARouteView()
    }
}
