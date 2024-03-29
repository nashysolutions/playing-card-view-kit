//
//  Created by Robert Nash on 26/03/2024.
//

import SwiftUI

// This isn't specific to playing cards, so could be put in some other module.
public struct HorizontalCardSelectionView<Content: View, Item: RandomAccessCollection & MutableCollection>: View where Item.Element: Identifiable {
    
    @Binding var data: Item
    
    let spacing: CGFloat

    @ViewBuilder
    var content: (Binding<Item.Element>) -> Content
    
    public init(data: Binding<Item>, spacing: CGFloat, content: @escaping (Binding<Item.Element>) -> Content) {
        _data = data
        self.spacing = spacing
        self.content = content
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: spacing) {
                ForEach($data) { item in
                    content(item)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, spacing)
    }
}
