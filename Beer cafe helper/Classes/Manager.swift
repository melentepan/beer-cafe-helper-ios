import Foundation
import UIKit

class Manager {
    static let shared = Manager()
    
    var beerArray = [Beer]()
    
    private init() {}
    
    func backButtonPressed(_ sender: ViewController) {
        sender.dismiss(animated: true)
    }
    
}
