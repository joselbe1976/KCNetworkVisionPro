//
//  UseCaseHeros.swift
//
//
//  Created by Jose Luis Bustos Esteban on 17/2/24.
//

import Foundation

public final class UseCaseHeros{
    let NetWorkHeros = NetworkHeros()
    let NetworkTrans = NetworkTransformationsHero()
    let NetworkLocals = NetworkLocalizations()
    
    public init(){}
    
    public func getData(filter: String = "") async -> [HerosData] {
        var herosFinal = [HerosData]()
        
        //get The Heros
        let heros = await NetWorkHeros.getHeros(filter: filter)
        
        //For Each hero, call to LOcations and transformations
        for hero in heros {
            //Tranformations of Hero
            let trans = await NetworkTrans.getHerosTransformation(idHero: hero.id.uuidString)
            
            //Locations of Hero
            let locals = await NetworkLocals.getHerosLocalizations(idHero: hero.id.uuidString)
            
            
            //Generate final Model and add to Array
            
            let HeroFin  = HerosData(id: hero.id, favorite: hero.favorite, description: hero.description, photo: hero.photo, name: hero.name, locations: locals, transformations: trans)
            herosFinal.append(HeroFin)
            
            
        }
        
        return herosFinal
    }
}
