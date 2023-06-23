//
//  Tag.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 20/06/23.
//

import Foundation

struct Tag {
    let iconName: String
    let name: String
    let pointOfInterest: String
}

extension Tag {
    
    static var allTags = [
        Tag(iconName: "building.columns.fill", name: "Museus", pointOfInterest: "museum"),
        Tag(iconName: "eye.circle.fill", name: "Atrações Locais", pointOfInterest: "theater"),
        Tag(iconName: "beach.umbrella.fill", name: "Praias", pointOfInterest: "beach"),
        Tag(iconName: "tree.fill", name: "Parques", pointOfInterest: "park"),
        Tag(iconName: "gift.fill", name: "Compras", pointOfInterest: "store"),
        Tag(iconName: "party.popper.fill", name: "Entretenimento", pointOfInterest: "nightlife"),
        Tag(iconName: "leaf.fill", name: "Natureza", pointOfInterest: "nationalPark"),
        Tag(iconName: "fork.knife", name: "Culinária", pointOfInterest: "restaurant"),
        Tag(iconName: " ", name: " ", pointOfInterest: " ")
    ]
    
}

//MARK: Algumas dessas tags precisam agrupar vários pontos de interesse

