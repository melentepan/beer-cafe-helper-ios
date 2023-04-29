import Foundation

class Beer: Codable {
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
    
    public enum CodingKeys: String, CodingKey {
        case name, price, countPerDay, countOfSelected, countOfSelled
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decode(Float.self, forKey: .price)
        self.countPerDay = try container.decode(Int.self, forKey: .countPerDay)
        self.countOfSelected = try container.decode(Int.self, forKey: .countOfSelected)
        self.countOfSelled = try container.decode(Int.self, forKey: .countOfSelled)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.name, forKey: .name)
        try container.encode(self.price, forKey: .price)
        try container.encode(self.countPerDay, forKey: .countPerDay)
        try container.encode(self.countOfSelected, forKey: .countOfSelected)
        try container.encode(self.countOfSelled, forKey: .countOfSelled)
    }
}
