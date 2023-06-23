//
//  Tag.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 20/06/23.
//

import Foundation
import MapKit

struct Tag {
    let iconName: String
    let name: String
    let searchText: String
    let pointOfInterest: MKPointOfInterestCategory
}

extension Tag {
    
    static var allTags = [
        Tag(iconName: "building.columns.fill", name: "Museus", searchText: "museum", pointOfInterest: MKPointOfInterestCategory.museum),
        Tag(iconName: "eye.circle", name: "Atrações Locais", searchText: "theater", pointOfInterest: MKPointOfInterestCategory.theater),
        Tag(iconName: "beach.umbrella.fill", name: "Praias", searchText: "beach", pointOfInterest: MKPointOfInterestCategory.beach),
        Tag(iconName: "tree.fill", name: "Parques", searchText: "park", pointOfInterest: MKPointOfInterestCategory.park),
        Tag(iconName: "gift.fill", name: "Compras", searchText: "store", pointOfInterest: MKPointOfInterestCategory.store),
        Tag(iconName: "party.popper.fill", name: "Entretenimento", searchText: "nightlife", pointOfInterest: MKPointOfInterestCategory.nightlife),
        Tag(iconName: "leaf.fill", name: "Natureza", searchText: "nationalPark", pointOfInterest: MKPointOfInterestCategory.nationalPark),
        Tag(iconName: "fork.knife", name: "Culinária", searchText: "restaurant", pointOfInterest: MKPointOfInterestCategory.restaurant),
        Tag(iconName: "mappin", name: "Outros", searchText: "university", pointOfInterest: MKPointOfInterestCategory.university)
//        Tag(iconName: "building.columns.fill", name: "Museus", pointOfInterest: "museum"),
//        Tag(iconName: "eye.circle", name: "Atrações Locais", pointOfInterest: "theater"),
//        Tag(iconName: "beach.umbrella.fill", name: "Praias", pointOfInterest: "beach"),
//        Tag(iconName: "tree.fill", name: "Parques", pointOfInterest: "park"),
//        Tag(iconName: "gift.fill", name: "Compras", pointOfInterest: "store"),
//        Tag(iconName: "party.popper.fill", name: "Entretenimento", pointOfInterest: "nightlife"),
//        Tag(iconName: "leaf.fill", name: "Natureza", pointOfInterest: "nationalPark"),
//        Tag(iconName: "fork.knife", name: "Culinária", pointOfInterest: "restaurant"),
//        Tag(iconName: "heart", name: "Empty", pointOfInterest: " ")
    ]
    
}

//MARK: Algumas dessas tags precisam agrupar vários pontos de interesse

