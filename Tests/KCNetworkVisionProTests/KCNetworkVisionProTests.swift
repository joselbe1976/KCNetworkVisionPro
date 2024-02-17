import XCTest
import RealityKit
@testable import KCNetworkVisionPro

final class KCNetworkVisionProTests: XCTestCase {
    func testExample() async throws {
        
        //Forzamos un token de login
        let token = "<<Here your token JWT from POstman or OpenRapid>>"
        
        ConstantsLibrary.CONST_TEST_TOKEN_JWT = token  //asignamos token por defecto

        //los networks
        let herosN = NetworkHeros()
        let NetwoorkTrans = NetworkTransformationsHero()
        let NetworkLocals = NetworkLocalizations()
        
        
        //Resultado Final
        var herosFinal = [HerosData]()
        
        //Lista Heroes
        let heros = await herosN.getHeros(filter: "")
        
        //Recorremos cada Heroe solicitando sus transformaciones y localizaciones
        for hero in heros {
            //Tranformaciones
            let trans = await NetwoorkTrans.getHerosTransformation(idHero: hero.id.uuidString)
            NSLog("Heroe \(hero.name)  tiene \(trans.count)  Tranformaciones")
            
            //localizaciones
            let locals = await NetworkLocals.getHerosLocalizations(idHero: hero.id.uuidString)
            NSLog("Heroe \(hero.name)  tiene \(locals.count)  Localizaciones")
            
            //Añado a HerosFinal
            
            let HeroFin  = HerosData(id: hero.id, favorite: hero.favorite, description: hero.description, photo: hero.photo, name: hero.name, locations: locals, transformations: trans)
            
            
            herosFinal.append(HeroFin)
            
           
            
            
        
            
            
            
        }
       
        NSLog("Total heros \(herosFinal.count)")
        
    }
}
