
public class MenuItem: Preparable, PriceCalculable {
    public let name: String
    public let basePrice: Double
    private let priceCalculator: PriceCalculator
    
     init(name: String, basePrice: Double, priceCalculator: PriceCalculator) {
        self.name = name
        self.basePrice = basePrice
        self.priceCalculator = priceCalculator
    }
    
    public func prepare() -> String {
        return "Preparing \(name)"
    }
    
    public func calculatePrice() -> Double {
        return priceCalculator.calculatePrice(for: self)
    }
}

public class Coffee: MenuItem {
    public enum Size: Double {
        case small = 1.0
        case medium = 1.2
        case large = 1.4
    }
    
    public let size: Size
    
    public init(name: String, basePrice: Double, size: Size) {
        self.size = size
        super.init(name: name, basePrice: basePrice, priceCalculator: SizePriceCalculator())
    }
    
    public override func prepare() -> String {
        return super.prepare() + " coffee, size: \(size)"
    }
}

public class Pastry: MenuItem {
    public let isWarmed: Bool
    
    public init(name: String, basePrice: Double, isWarmed: Bool) {
        self.isWarmed = isWarmed
        super.init(name: name, basePrice: basePrice, priceCalculator: WarmedPriceCalculator())
    }
    
    public override func prepare() -> String {
        return super.prepare() + (isWarmed ? " (warmed)" : "")
    }
}

public class Order {
    private(set) public var items: [MenuItem] = []
    
    public init() {}
    
    public func addItem(_ item: MenuItem) {
        items.append(item)
    }
    
    public func removeItem(_ item: MenuItem) {
        items.removeAll { $0 === item }
    }
    
    public func totalPrice() -> Double {
        return items.reduce(0) { $0 + $1.calculatePrice() }
    }
}

