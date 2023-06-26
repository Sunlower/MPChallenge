//
//  RoutView.swift
//  NovoWatch Watch App
//
//  Created by Ieda Xavier on 21/06/23.
//

import Foundation
import SwiftUI


struct RouteView: View {
    @ObservedObject var locationDelegate: LocationDelegate
    var card: DataModel

    var body: some View {
        VStack {

            HStack{
                Text(card.localidade)
                  .font(
                    Font.custom("SF Pro Rounded", size: 22)
                      .weight(.bold)
                  )
                  .foregroundColor(.white)

                Spacer()
                NavigationLink {
                    MapView(locationDelegate: locationDelegate)
                } label: {
                    Image(systemName: "map.fill")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 40, maxHeight: 40)
                .buttonStyle(.plain)

            }
            .padding(10)

            ScrollView {
                ForEach(card.locais) { dataModel in
                    CardRoute(nameLocal: dataModel.nameLocal, tagLocal: dataModel.tagLocal)
                }
            }
        }
    }
}

struct RouteView_Previews: PreviewProvider {


    static var previews: some View {
        RouteView(locationDelegate: LocationDelegate(), card: DataModel(localidade: "Fortaleza/CE", temperatura:"30", data:"14 de Abril de 2023", image : "imagem", locais: [RouteModel(nameLocal: "Praia de Iracema", tagLocal:"Praia")]))
    }
}
