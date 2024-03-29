//
//  Created by Robert Nash on 29/03/2024.
//

import SwiftUI

public protocol CardFaceView: View {
    var cardWidth: CGFloat { get }
    var cornerRadius: CGFloat { get }
}
