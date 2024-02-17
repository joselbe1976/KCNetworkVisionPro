//
//  File.swift
//  
//
//  Created by Jose Luis Bustos Esteban on 17/2/24.
//

import Foundation


public final class UseCaseLogin{
    let netLogin = NetworkLogin()
    
    public init(){}
    /// functionof login in server
    public func loginApp(user: String, password: String) async -> Bool {
        return await netLogin.loginApp(user: user, password: password)
    }
    
    /// function isLogged indicate if the token JWt is valid
    public func isLogged() async -> Bool {
        let value = KeyChainKC().loadKC(key: ConstantsLibrary.CONST_TOKEN_ID_KEYCHAIN)
        if let valor = value {
            if valor != "" {
                return true
            } else{
                return false
            }
        } else {
            return false
        }
    }
    
    /// function close session
    public func closeSession() -> Bool {
        return  KeyChainKC().deleteKC(key: ConstantsLibrary.CONST_TOKEN_ID_KEYCHAIN)
        
    }
    
    
    
}
