//
//  Created by Robert Nash on 16/03/2024.
//

import SwiftUI

public protocol CardScoreProvider {
    associatedtype Metric: ScoreMechanism
    var score: Metric { get }
}

public extension CardScoreProvider {
    
    var points: UInt {
        score.points
    }
}
