//
//  CreateRouteView.swift
//  MPChallenge
//
//  Created by Vinícius Cavalcante on 19/06/23.
//

import SwiftUI
import MapKit

extension MKMapItem {
    
    func distance(to coordinate: (Double, Double)) -> Double {
        return placemark.location?.distance(from: CLLocation(latitude: coordinate.0, longitude: coordinate.1)).magnitude ?? 0
    }
    
}

struct CreateRouteView: View {
    @StateObject var locationDataManager = LocationDataManager()
//    @ObservedObject var weatherKitManager = WeatherKitManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.83834587046632,
                                       longitude: 14.254053016537693),
        span: MKCoordinateSpan(latitudeDelta: 0.05,
                               longitudeDelta: 0.05)
    )
    
//    @State private var currentCity = "Carregando..."
    @State private var searchResults: [MKMapItem] = []
    @State var searchCurrent: [MKMapItem] = []
    let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsShowsTrafficKey: true] as [String: Any]
//    var currentLocation: MKMapItem
    
    var body: some View {
        if locationDataManager.authorizationStatus == .authorizedWhenInUse {
            VStack {
                Button("Teste"){
//                    currentLocation = MKMapItem(placemark: MKPlacemark(coordinate: region.center))
                    //MARK: ADICIONAR O LOCAL ATUAL DO USUÁRIO COMO PRIMEIRO ITEM DO ARRAY DE MKMAPITEM
                    MKMapItem.openMaps(with: searchResults, launchOptions: options)
                }
                CreateRoteWeatherStatusView()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Tag.allTags, id: \.name) { filterTag in
                            TagButton(searchResults: $searchResults, searchCurrent: searchCurrent, filterTag: filterTag)
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
                //                List(searchResults.sorted{ $0.distance(to: locationDataManager.coordinate) < $1.distance(to: locationDataManager.coordinate) }, id: \.self) { result in
                //                    VStack (alignment: .leading) {
                //                        Text(result.name ?? "")
                //                        Text(result.distance(to: locationDataManager.coordinate).description)
                //                    }
                //                }
                ScrollView {
                    ForEach(searchResults.sorted{ $0.distance(to: locationDataManager.coordinate) < $1.distance(to: locationDataManager.coordinate) }, id: \.self){ result in
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image(getImage(tagName: getCategory(pointOfInterest: result.pointOfInterestCategory ?? MKPointOfInterestCategory.aquarium)))
                                    .resizable()
                                    .frame(width: 60, height: 65)
//                                    .padding(.leading)
                                VStack(alignment: .leading) {
                                    Text(result.name ?? " ")
                                        .font(.title3)
                                        .bold()
                                        .lineLimit(1)
                                    Spacer()
                                    HStack {
                                        Image(systemName: getCategory(pointOfInterest: result.pointOfInterestCategory ?? MKPointOfInterestCategory.aquarium).iconName)
                                            .foregroundStyle(.white)
                                            .font(.caption)
//                                            .background(.red)
                                        //                                        Text(result.pointOfInterestCategory?.rawValue ?? " ")
                                        Text(getCategory(pointOfInterest:result.pointOfInterestCategory ?? MKPointOfInterestCategory.aquarium).name)
                                            .foregroundStyle(.white)
                                            .font(.caption)
//                                            .background(.red)
                                    }
                                    .padding(.leading, 4)
                                    .padding(.trailing, 4)
                                    .background {
                                        Capsule()
                                            .fill(.blue)
                                            .frame(height: 24)
                                    }
                                    .padding(.bottom, 4)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            .padding()
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1)
                                .frame(maxWidth: .infinity)
                        }
                        
                        .padding()
                    }
                }
            }
//            .task {
//                await weatherKitManager.getWeather(latitude: locationDataManager.latitude,
//                                                   longitude: locationDataManager.longitude)
//            }
            .onAppear {
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: locationDataManager.latitude,
                        longitude: locationDataManager.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
                )
//                                let geocoder = CLGeocoder()
//                                let location = CLLocation(latitude: region.center.latitude,
//                                                          longitude: region.center.longitude)
//                                geocoder.reverseGeocodeLocation(location, completionHandler: { placemarks, _ -> Void in
//                
//                                    guard let placemark = placemarks?.first else {
//                                        return
//                                    }
//                
//                                    guard let city = placemark.locality else {
//                                        return
//                                    }
//                
//                                    guard let state = placemark.administrativeArea else {
//                                        return
//                                    }
//                
//                                    currentCity = "\(city), \(state)"
//                                })
            }
        } else {
            Text("Error Loading Location")
        }
    }
    
    func getImage(tagName: Tag) -> String {
        
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
        
        return "museumStamp"
    }
    
    func getCategory(pointOfInterest: MKPointOfInterestCategory) -> Tag {
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
}
