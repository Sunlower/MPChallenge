//
//  ContentView.swift
//  NovoWatch Watch App
//
//  Created by Ieda Xavier on 21/06/23.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var locationDelegate: LocationDelegate

    private let cards = [
        DataModel(localidade: "Fortaleza/CE", temperatura:"30", data:"14/04/2023", image : "Fortaleza", locais: [RouteModel(nameLocal: "Praia de Iracema", tagLocal:"Praia")]),
        DataModel(localidade: "Fortaleza/CE", temperatura:"30", data:"14/04/2023", image : "Fortaleza", locais: [RouteModel(nameLocal: "Praia de Iracema", tagLocal:"Praia")]),
        DataModel(localidade: "Fortaleza/CE", temperatura:"30", data:"14/04/2023", image : "Fortaleza", locais: [RouteModel(nameLocal: "Praia de Iracema", tagLocal:"Praia")]),
        DataModel(localidade: "Fortaleza/CE", temperatura:"30", data:"14/04/2023", image : "Fortaleza", locais: [RouteModel(nameLocal: "Praia de Iracema", tagLocal:"Praia")]),
        
    ]

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                Text("Últimas rotas")
                    .font(
                        Font.custom("SF Pro Rounded", size: 22)
                            .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .frame(width: 181, height: 36, alignment: .topLeading)

                ScrollView {
                    ForEach(cards) { dataModel in
                        NavigationLink {
                            RouteView(locationDelegate: locationDelegate, card: dataModel)
                        } label: {
                            CardHome(localidade:dataModel.localidade, temperatura:dataModel.temperatura,data:dataModel.data, image:dataModel.image)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    private let cards = [
        DataModel(localidade: "Fortaleza/CE", temperatura:"30", data:"14 de Abril de 2023", image : "imagem", locais: [RouteModel(nameLocal: "Praia de Iracema", tagLocal:"Praia")]),
        DataModel(localidade: "Fortaleza/CE", temperatura:"30", data:"14 de Abril de 2023", image : "imagem", locais: [RouteModel(nameLocal: "Praia de Iracema", tagLocal:"Praia")]),
        DataModel(localidade: "Fortaleza/CE", temperatura:"30", data:"14 de Abril de 2023", image : "imagem", locais: [RouteModel(nameLocal: "Praia de Iracema", tagLocal:"Praia")]),
        DataModel(localidade: "Fortaleza/CE", temperatura:"30", data:"14 de Abril de 2023", image : "imagem", locais: [RouteModel(nameLocal: "Praia de Iracema", tagLocal:"Praia")]),

    ]

    static var previews: some View {
        HomeView(locationDelegate: LocationDelegate())
    }
}
