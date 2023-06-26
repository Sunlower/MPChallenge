//
//  CardInstructions.swift
//  NovoWatch Watch App
//
//  Created by Ieda Xavier on 23/06/23.
//

import SwiftUI

struct CardInstructions: View {
    var body: some View {
        ZStack{

            HStack{
                VStack{
                    Text("2")
                      .font(
                        Font.custom("SF Pro Rounded", size: 18)
                          .weight(.bold)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))

                    Text("min")
                        .font(
                        Font.custom("SF Pro Rounded", size: 12)
                        .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                }
                Spacer()
                VStack{
                    Text("800")
                      .font(
                        Font.custom("SF Pro Rounded", size: 18)
                          .weight(.bold)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))

                    Text("m")
                        .font(
                        Font.custom("SF Pro Rounded", size: 12)
                        .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                }
                Spacer()

                ZStack(alignment: .center){
                    Image(systemName: "arrow.turn.up.right")
                        .bold()
                        .foregroundColor(.black)
                }
                .frame(width: 29, height: 29, alignment: .center)
                .background(Color(red: 0.87, green: 0.69, blue: 0.49))
                .cornerRadius(40)
            }
            .padding(.horizontal, 30)
        }
        .frame(maxWidth:.infinity , maxHeight: 44)
        .background(.white.opacity(0.2))
        .cornerRadius(40)
    }
}

struct CardInstructions_Previews: PreviewProvider {
    static var previews: some View {
        CardInstructions()
    }
}
