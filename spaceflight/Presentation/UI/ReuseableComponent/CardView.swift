//
//  CardView.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 12/11/25.
//

import SwiftUI

struct CardView<Content:View>: View {
    var fillColor: Color = Color.white
    var borderColor: Color = Color.gray
    var borderWidth: CGFloat = 1
    var cornerRadius:CGFloat = 16
    var spacing: CGFloat = 0
    //padding
    var paddingTop: CGFloat = 4
    var paddingBottom: CGFloat = 4
    var paddingLeft: CGFloat = 4
    var paddingRight: CGFloat = 4
    //frame
    var alignmentFrame: Alignment = .center
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var isVStack: Bool = true
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        if isVStack {
            ReusableVStack(spacing:spacing,
                           paddingTop: paddingTop,
                           paddingBottom: paddingBottom,
                           paddingLeft: paddingLeft,
                           paddingRight: paddingRight,
                           frameAlignment: alignmentFrame,
                           frameWidth: width,
                           frameHeight: height) {
                content()
            }.background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(fillColor)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor,lineWidth: borderWidth))
            )
        } else {
            ReusableHStack(spacing:spacing,
                           paddingTop: paddingTop,
                           paddingBottom: paddingBottom,
                           paddingLeft: paddingLeft,
                           paddingRight: paddingRight,
                           frameWidth: width,
                           frameHeight: height) {
                content()
            }.background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(fillColor)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor,lineWidth: borderWidth))
            )
        }
    }
}
