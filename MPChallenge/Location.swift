//
//  Location.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 19/06/23.
//

import Foundation
import MapKit

struct Location: Equatable {
    // swiftlint:disable identifier_name
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.isSelected == rhs.isSelected && lhs.imageName == rhs.imageName && lhs.tagCategory == rhs.tagCategory && lhs.local == rhs.local
    }
    var local: MKMapItem
    var tagCategory: Tag
    var imageName: String
    var isSelected: Bool = false

    static func getImage(tagName: Tag) -> String {

        if tagName.name == "Museus" {
            return "museumStamp"
        }
        if tagName.name == "Atrações Locais" {
            return "localStamp"
        }
        if tagName.name == "Praias" {
            return "beachStamp"
        }
        if tagName.name == "Parques" {
            return "parkStamp"
        }
        if tagName.name == "Compras" {
            return "saleStamp"
        }
        if tagName.name == "Entretenimento" {
            return "entertainmentStamp"
        }
        if tagName.name == "Natureza" {
            return "natureStamp"
        }
        if tagName.name == "Culinária" {
            return "culinaryStamp"
        }
        return "otherStamp"
    }

    static func getCategory(pointOfInterest: MKPointOfInterestCategory) -> Tag {
//        let museums = [
//            MKPointOfInterestCategory.museum
//        ]
//
//        let localAtractions = [
//            //            MKPointOfInterestCategory.library,
//            //            MKPointOfInterestCategory.marina,
//            MKPointOfInterestCategory.theater
//        ]
//
//        let beaches = [
//            MKPointOfInterestCategory.beach,
//            MKPointOfInterestCategory.marina
//        ]
//
//        let nature = [
//            //            MKPointOfInterestCategory.park,
//            //            MKPointOfInterestCategory.nationalPark
//            MKPointOfInterestCategory.nationalPark,
//        ]
//
//        let parks = [
//            MKPointOfInterestCategory.park,
//
//        ]
//
//        let culinary = [
////            MKPointOfInterestCategory.bakery,
////            MKPointOfInterestCategory.brewery,
////            MKPointOfInterestCategory.cafe,
////            MKPointOfInterestCategory.foodMarket,
//            MKPointOfInterestCategory.restaurant,
////            MKPointOfInterestCategory.winery
//        ]
//
//        let shopping = [
//            MKPointOfInterestCategory.store
//        ]
//
//        let entertainment = [
////            MKPointOfInterestCategory.brewery,
////            MKPointOfInterestCategory.movieTheater,
//            MKPointOfInterestCategory.nightlife
//        ]
        
        if pointOfInterest == MKPointOfInterestCategory.museum {
            return Tag.allTags[0]
        }
        
        if pointOfInterest == MKPointOfInterestCategory.theater {
            return Tag.allTags[1]
        }
        if pointOfInterest == MKPointOfInterestCategory.beach{
            return Tag.allTags[2]
        }
        if pointOfInterest == MKPointOfInterestCategory.park{
            return Tag.allTags[3]
        }
        if pointOfInterest == MKPointOfInterestCategory.store{
            return Tag.allTags[4]
        }
        if pointOfInterest == MKPointOfInterestCategory.nightlife{
            return Tag.allTags[5]
        }
        if pointOfInterest == MKPointOfInterestCategory.nationalPark{
            return Tag.allTags[6]
        }
        if pointOfInterest == MKPointOfInterestCategory.restaurant{
            return Tag.allTags[7]
        }
//        if nature.contains(pointOfInterest) {
//            return Tag.allTags[6]
//        }
//        if parks.contains(pointOfInterest) {
//            return Tag.allTags[4]
//        }
//        if culinary.contains(pointOfInterest) {
//            return Tag.allTags[7]
//        }
//        if shopping.contains(pointOfInterest) {
//            return Tag.allTags[5]
//        }
//        if entertainment.contains(pointOfInterest) {
//            return Tag.allTags[6]
//        }
        return Tag.allTags[8]
        
    }

    // swiftlint:disable identifier_name
    init(_ mapItem: MKMapItem) {
        self.local = mapItem
        if let category = mapItem.pointOfInterestCategory {
            let tag = Self.getCategory(pointOfInterest: category)
            self.tagCategory = tag
            self.imageName = Self.getImage(tagName: tag)
        } else {
            // default values
            self.imageName = "museumStamp"
            self.tagCategory = .allTags.last!
        }
    }
}
