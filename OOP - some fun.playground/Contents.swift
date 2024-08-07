import UIKit




public class CoffeeShop {
    private let orderProcessors: [OrderProcessor]
    
    public init(orderProcessors: [OrderProcessor]) {
        self.orderProcessors = orderProcessors
    }
    
    public func processOrder(_ order: Order) {
        for processor in orderProcessors {
            processor.process(order: order)
        }
    }
}

let shop = CoffeeShop(orderProcessors: [OrderValidator(), OrderLogger()])
let latte = Coffee(name: "Latte", basePrice: 3.5, size: .medium)
let order = Order()
order.addItem(latte)
shop.processOrder(order)


