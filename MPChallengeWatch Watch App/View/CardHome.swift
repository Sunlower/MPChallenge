//
//  Cardmodel.swift
//  NovoWatch Watch App
//
//  Created by Ieda Xavier on 21/06/23.
//

import Foundation
import UIKit
import SwiftUI


struct CardHome: View {

    var localidade : String
    var temperatura : String
    var data : String
    var image : String

    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .scaledToFill()

            VStack{
                HStack{
                    Text(localidade)
                        .font(.system(.body, design: .rounded))
                    Spacer()
                    Text(temperatura)
                        .font(.system(.body, design: .rounded))
                }
                .padding(10)
                .background(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 53/255, green: 91/255, blue: 111/255, opacity: 0.8),Color(red: 53/255, green: 91/255, blue: 111/255, opacity: 0.2)]), startPoint: .top, endPoint: .bottom)
                    )

                Spacer()
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(red: 53/255, green: 91/255, blue: 111/255, opacity: 0.8))
                        .frame(maxWidth: .infinity, maxHeight: 50)

                    HStack{
                        Text(data)
                            .font(.system(.body, design: .rounded))
                        Spacer()
                        Text("Consultar")
                            .font(.system(.body, design: .rounded))
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        .cornerRadius(6)
    }
}

