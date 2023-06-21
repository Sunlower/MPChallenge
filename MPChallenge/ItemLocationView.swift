//
//  ItemLocationView.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 20/06/23.
//

import SwiftUI

struct ItemLocationView: View {

    var body: some View {
        ScrollView{
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .frame(height: 84)
                Image(systemName: "car")
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text("Title")
                HStack {
                    Image(systemName: "car")
                        .foregroundStyle(.white)
                    Text("Teste")
                        .foregroundStyle(.white)
                }
                .padding()
                .background {
                    Capsule()
                        .fill(.blue)
                        .frame(height: 32)

                }
            }
            .padding()
        }
        
    }
}
