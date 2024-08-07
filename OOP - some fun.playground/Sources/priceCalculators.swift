import Foundation

import Foundation

public struct SizePriceCalculator: PriceCalculator {
    public init() {}
    
    public func calculatePrice(for item: MenuItem) -> Double {
        guard let coffee = item as? Coffee else { return item.basePrice }
        return item.basePrice * coffee.size.rawValue
    }
}

public struct WarmedPriceCalculator: PriceCalculator {
    public init() {}
    
    public func calculatePrice(for item: MenuItem) -> Double {
        guard let pastry = item as? Pastry else { return item.basePrice }
        return pastry.isWarmed ? item.basePrice + 0.5 : item.basePrice
    }
}
