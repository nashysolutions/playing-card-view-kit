//
//  Created by Robert Nash on 29/03/2024.
//

import Foundation

public protocol CardModel {
    associatedtype C: CardScoreProvider
    var card: C { get }
    var isFaceUp: Bool { get set }
}

public extension CardModel {

    func borderLineWidth(for width: CGFloat) -> CGFloat {
        width * 0.01
    }
    
    func cornerRadius(for width: CGFloat) -> CGFloat {
        width * 0.05
    }
    
    mutating func flip() {
        isFaceUp.toggle()
    }
}
