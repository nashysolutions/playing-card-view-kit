//
//  Created by Robert Nash on 21/03/2024.
//

import SwiftUI

public protocol ScrollingCardsMenu: View {
    
    associatedtype C: View
    associatedtype D: RandomAccessCollection & MutableCollection where D.Element: Identifiable
    
    var data: Binding<D> { get }
    var cardView: (_ item: D.Element) -> C { get }
    var didTap: (_ item: Binding<D.Element>) -> Void { get }
}

public extension ScrollingCardsMenu {
    
    func drawBody() -> some View {
        HorizontalCardSelectionView(
            data: data,
            spacing: spacing,
            content: content
        )
        .frame(height: cardSize.height)
        .scrollClipDisabled()
    }
    
    private func content(_ item: Binding<D.Element>) -> some View {
        cardView(item.wrappedValue)
            .frame(width: cardSize.width)
            .onTapGesture {
                didTap(item)
            }
    }
    
    private var cardSize: CGSize {
        CardDimensions(width: 160).size
    }
    
    private var spacing: CGFloat {
        cardSize.width / 20
    }
}

private struct CardDimensions {
    
    let width: CGFloat
    
    private var height: CGFloat {
        let ratio = playingCardAspectRatio
        return width / ratio
    }
    
    var size: CGSize {
        CGSize(width: width, height: height)
    }
}
