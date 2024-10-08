//
//  ConstantsLibrary.swift
//
//
//  Created by Jose Luis Bustos Esteban on 17/2/24.
//

import Foundation

struct ConstantsLibrary{

    //API URL (Backend). We can use CriptoKit to hide the URL (next module)
    public static let CONST_API_URL = "https://dragonball.keepcoding.education/api"

    //ID TOKEN keychain. We can use CriptoKit to hide the URL (next module)
    public static let CONST_TOKEN_ID_KEYCHAIN = "tokenJWTKeyChainAppVisionProClassxxxxx"
    
    
    //For Testing only. Def Token JWT.
    nonisolated(unsafe) public static var CONST_TEST_TOKEN_JWT:String = ""
    
}

