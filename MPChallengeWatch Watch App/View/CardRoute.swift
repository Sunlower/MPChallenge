//
//  CardRoute.swift
//  NovoWatch Watch App
//
//  Created by Ieda Xavier on 22/06/23.
//

import SwiftUI

struct CardRoute: View {

    var nameLocal: String
    var tagLocal: String

    var body: some View {

            HStack{
                Image(tagLocal)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 50)
                    .padding(.leading, 10)

                VStack(alignment: .leading){
                    Spacer()
                    Text(nameLocal)
                        .font(.system(.body, design: .rounded))
                  

                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(.cyan)
                            .frame(maxWidth: 100, maxHeight: 30)
                        HStack{
                            Image(systemName: "beach.umbrella.fill")
                            Text(tagLocal)
                                .font(.system(.body, design: .rounded))
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal,5)
            }
            .background(Color(red: 53/255, green: 91/255, blue: 111/255, opacity: 0.8))
            .cornerRadius(6)
    }
}

struct CardRoute_Previews: PreviewProvider {

    static var previews: some View {
        CardRoute(nameLocal: "Praia de iracema", tagLocal: "Praia")
    }
}
