//
//  CustomText.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 12/11/25.
//

import SwiftUI


struct ReusableText: View {
    var text: String? = ""
    var isTextColorHex: Bool = false
    var textColorHex: String = ""
    var textColor: Color = .black
    var fontSize: CGFloat = 12
    var fontWeight: Font.Weight = .regular
    var maxLines: Int? = nil
    var isItalic: Bool = false
    var isUnderline: Bool = false
    var underlineColor: String = ""
    //padding
    var paddingTop: CGFloat = 0
    var paddingBottom: CGFloat = 0
    var paddingLeft: CGFloat = 0
    var paddingRight: CGFloat = 0
    
    var body: some View {
        Text(text ?? "Test Text")
            .font(.system(size: fontSize, weight: fontWeight))
            .foregroundColor( isTextColorHex ? Color(hex: textColorHex) : textColor )
            .lineLimit(maxLines)
            .padding(.top,paddingTop)
            .padding(.bottom,paddingBottom)
            .padding(.leading,paddingLeft)
            .padding(.trailing,paddingRight)
            .underline(isUnderline, color: isTextColorHex ? Color(hex: textColorHex) : textColor )
            .italic(isItalic)
    }
}
