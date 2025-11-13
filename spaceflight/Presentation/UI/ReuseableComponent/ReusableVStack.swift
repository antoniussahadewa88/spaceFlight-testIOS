//
//  ReusableVStack.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 12/11/25.
//

import SwiftUI

struct ReusableVStack<Content:View>: View {
    var alignment: HorizontalAlignment = .leading
    var spacing: CGFloat = 0
    var paddingTop: CGFloat = 0
    var paddingBottom: CGFloat = 0
    var paddingLeft: CGFloat = 0
    var paddingRight: CGFloat = 0
    var frameAlignment: Alignment = .center
    var frameWidth: CGFloat? = nil
    var frameHeight: CGFloat? = nil
    var backgroudColor: Color = .white
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(alignment:alignment, spacing: spacing) {
            content()
        }
        .frame(width: frameWidth,height: frameHeight,alignment: frameAlignment)
        .padding(.top,paddingTop)
        .padding(.bottom,paddingBottom)
        .padding(.leading,paddingLeft)
        .padding(.trailing,paddingRight)
    }
}
