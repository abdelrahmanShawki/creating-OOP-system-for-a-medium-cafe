import Foundation

public protocol Preparable {
    func prepare() -> String
}

public protocol PriceCalculable {
    func calculatePrice() -> Double
}

public protocol PriceCalculator {
    func calculatePrice(for item: MenuItem) -> Double
}

public protocol OrderProcessor {
    func process(order: Order)
}


