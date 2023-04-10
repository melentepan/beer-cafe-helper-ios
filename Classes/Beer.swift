import Foundation

class Beer {
    var name: String
    var price: Float
    var countPerDay: Int
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
