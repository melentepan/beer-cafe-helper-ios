import Foundation

class Manager {
    static let shared = Manager()
    
    var beerArray = [Beer]()
    
    private init() {}
    
    var currentBeerIndex = 0
    
}
