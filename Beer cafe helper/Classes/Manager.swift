import Foundation

class Manager {
    static let shared = Manager()
    
    var beerArray = [Beer]()
    
    private init() {}
    
    var currentBeerIndex = 0
    
    func saveBeer(_ beer: Beer) {
        UserDefaults.standard.set(encodable: beer, forKey: "beer\(beerArray.count - 1)")
        beerArray.append(beer)
    }
    
    func loadBeerArray() {
        while true {
            guard let loadedBeer = UserDefaults.standard.value(Beer.self, forKey: "beer\(beerArray.count - 1)") else { return }
            beerArray.append(loadedBeer)
        }
    }
}
