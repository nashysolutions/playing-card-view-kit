//
//  Created by Robert Nash on 29/03/2024.
//

import SwiftUI

public protocol CardView: View {
    
    associatedtype FrontFaceView: CardFaceView
    associatedtype BackFaceView: CardFaceView
    associatedtype Model: CardModel
    
    var model: Model { get }
    
    func frontView(cardWidth: CGFloat, cornerRadius: CGFloat) -> FrontFaceView
    func backView(cardWidth: CGFloat, cornerRadius: CGFloat) -> BackFaceView
}

public extension CardView {
    
    func drawBody() -> some View {
        GeometryReader { proxy in
            
            let width = proxy.frame(in: .local).width
            let cornerRadius = model.cornerRadius(for: width)
            
            frontView(cardWidth: width, cornerRadius: cornerRadius)
                .modifier(FaceContent(
                    isFaceUp: model.isFaceUp,
                    backView: {
                        backView(cardWidth: width, cornerRadius: cornerRadius)
                    })
                )
                .animation(.easeInOut(duration: 0.3), value: model.isFaceUp)
        }
    }
}
