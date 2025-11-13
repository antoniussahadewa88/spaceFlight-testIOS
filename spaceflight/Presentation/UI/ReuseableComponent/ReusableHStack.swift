//
//  ReusableHStack.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 12/11/25.
//

import SwiftUI

struct ReusableHStack<Content:View>: View {
    var spacing: CGFloat = 0
    var paddingTop: CGFloat = 0
    var paddingBottom: CGFloat = 0
    var paddingLeft: CGFloat = 0
    var paddingRight: CGFloat = 0
    var frameWidth: CGFloat? = nil
    var frameHeight: CGFloat? = nil
    var isVStack: Bool = true
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        HStack(spacing: spacing) {
            content()
        }
        .frame(width: frameWidth,height: frameHeight)
        .padding(.top,paddingTop)
        .padding(.bottom,paddingBottom)
        .padding(.leading,paddingLeft)
        .padding(.trailing,paddingRight)
    }
}
