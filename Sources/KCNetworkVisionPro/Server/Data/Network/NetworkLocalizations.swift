//
//  NetworkLocalizationsHero.swift.swift
//
//
//  Created by Jose Luis Bustos Esteban on 13/1/24.
//

import Foundation




final class NetworkLocalizations{
    public init(){}
    
    public func getHerosLocalizations(idHero: String) async -> [HerosLocationsModelResponse] {
        var modelReturn = [HerosLocationsModelResponse]()
        
        let urlCad : String = "\(ConstantsLibrary.CONST_API_URL)\(EndPoints.locations.rawValue)"
        var request : URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.post
        request.httpBody = try? JSONEncoder().encode(HeroTransformationsMOdelRequest(id: idHero))
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
    
        //Token JWT (habría que extraer de aqui) a algo generico o interceptor
        let JwtToken =  KeyChainKC().loadKC(key: ConstantsLibrary.CONST_TOKEN_ID_KEYCHAIN)
        if let tokenJWT = JwtToken{
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization") //Token
        }
        
        //Call to server
        
        do{
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let resp = response  as? HTTPURLResponse {
                if resp.statusCode == HTTPResponseCodes.SUCCESS {
                    modelReturn = try! JSONDecoder().decode([HerosLocationsModelResponse].self, from: data)
                }
            }
            
        }catch{
            
        }
        
        return modelReturn
    }
}






