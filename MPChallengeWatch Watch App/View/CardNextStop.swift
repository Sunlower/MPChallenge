//
//  CardNextStop.swift
//  NovoWatch Watch App
//
//  Created by Ieda Xavier on 23/06/23.
//

import SwiftUI

struct CardNextStop: View {
    var body: some View {
        ZStack {
            VStack{
                Text("Próxima parada")
                    .font(Font.custom("SF Pro Display", size: 10))
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                    .frame(width: 157, height: 14, alignment: .leading)

                Text("Praia de Iracema")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                    .frame(width: 159, height: 14, alignment: .leading)

                Text("Deseja ir para o próximo ponto?")
                    .font(Font.custom("SF Pro Display", size: 10))
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                    .frame(width: 159, height: 14, alignment: .leading)

                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 97, height: 20)
                      .background(Color(red: 0.21, green: 0.36, blue: 0.44))
                      .cornerRadius(12)
                    
                    Text("Sim")
                        .font(
                            Font.custom("SF Pro Rounded", size: 17)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 97, height: 20, alignment: .center)
                }
            }
        }
        .frame(width: 187, height: 129)
        .background(Color(red: 0.95, green: 0.95, blue: 0.95).opacity(0.2))
        .cornerRadius(22)

    }
}

struct CardNextStop_Previews: PreviewProvider {
    static var previews: some View {
        CardNextStop()
    }
}
