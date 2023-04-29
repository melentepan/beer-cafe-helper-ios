import Foundation

class Manager {
    static let shared = Manager()
    
    var beerArray = [Beer]()
    
    private init() {}
    
    var currentBeerIndex = 0
    
    
    func saveBeer() {
        UserDefaults.standard.set(encodable: beerArray, forKey: "beerArray")
    }
    
    func loadBeerArray() {
        guard let loadedBeerArray = UserDefaults.standard.value([Beer].self, forKey: "beerArray") else { return }
        beerArray = loadedBeerArray
    }
}
