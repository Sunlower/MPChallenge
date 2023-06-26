//
//  DataModel.swift
//  NovoWatch Watch App
//
//  Created by Ieda Xavier on 21/06/23.
//

import Foundation
import SwiftUI


struct DataModel: Identifiable {
    let id = UUID()
    var localidade : String
    var temperatura : String
    var data : String
    var image : String
    var locais: [RouteModel]

}

