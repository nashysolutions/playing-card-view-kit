//
//  Created by Robert Nash on 06/08/2022.
//

import SwiftUI

let playingCardAspectRatio = 3/4.5

public struct FaceContent<BackView: View>: AnimatableModifier {

    var rotation: Double // degrees
    var backView: () -> BackView
    
    public init(
        isFaceUp: Bool,
        backView: @escaping () -> BackView
    ) {
        self.rotation = isFaceUp ? 0 : 180
        self.backView = backView
    }
        
    public var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            Group {
                if rotation < 90 {
                    content // frontFaceView
                } else {
                    backView()
                }
            }
        }
        .aspectRatio(playingCardAspectRatio, contentMode: .fit)
        .rotation3DEffect(.degrees(rotation), axis: (0, 1, 0))
    }
}
