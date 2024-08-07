import Foundation


public class OrderValidator: OrderProcessor {
    public init() {}
    
    public func process(order: Order) {
        guard !order.items.isEmpty else {
            print("Error: Order is empty")
            return
        }
        print("Order validated successfully")
    }
}

public class OrderLogger: OrderProcessor {
    public init() {}
    
    public func process(order: Order) {
        print("New order received:")
        for item in order.items {
            print(item.prepare())
        }
        print("Total price: $\(String(format: "%.2f", order.totalPrice()))")
    }
}
