import Foundation

class Beer {
    let name: String
    var price: Float
    let countPerDay: Int
    var countOfSelected: Int
    var countOfSelled: Int
    
    init(name: String, price: Float, countPerDay: Int) {
        self.name = name
        self.price = price
        self.countPerDay = countPerDay
        self.countOfSelected = 0
        self.countOfSelled = 0
    }
}
