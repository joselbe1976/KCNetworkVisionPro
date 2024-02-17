//
//  Models.swift
//
//
//  Created by Jose Luis Bustos Esteban on 17/2/24.
//

import Foundation

//Response / Request models

struct HerosModelResponse: Codable, Identifiable {
    public let id: UUID
    public let favorite: Bool
    public let description: String
    public let photo: String
    public let name: String
}


//Filter the request od Heros by name
struct HeroModelRequest: Codable {
    public let name: String
}



struct HerosLocationsModelResponse: Codable, Identifiable {
    public let longitud: String
    public let latitud: String
    public let id: UUID
}


struct HerosTransformationsModelResponse: Codable, Identifiable {
    public let id: UUID
    public let name: String
    public let description: String
    public let photo: String
}
struct HeroTransformationsMOdelRequest: Codable {
    public let id: String
}




// Models to TRANSFORM

public struct HerosData: Codable, Identifiable {
    public let id: UUID
    public let favorite: Bool
    public let description: String
    public let photo: String
    public let name: String
    public let locations: [HerosLocationsModelResponse]
    public let transformations: [HerosTransformationsModelResponse]
    public let id3DModel: String
    
    
    init(id: UUID, favorite: Bool, description: String, photo: String, name: String, locations: [HerosLocationsModelResponse], transformations: [HerosTransformationsModelResponse], id3DModel: String = "") {
        
        self.id = id
        self.favorite = favorite
        self.description = description
        self.photo = photo
        self.name = name
        self.locations = locations
        self.transformations = transformations
        
        //goku
        if id.uuidString == "D13A40E5-4418-4223-9CE6-D2F9A28EBE94"{
            self.id3DModel = "goku.usdz"
        } else{
            self.id3DModel = id3DModel
        }
    }
}
