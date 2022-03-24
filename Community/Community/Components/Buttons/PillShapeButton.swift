//
//  PillButton.swift
//  NCCCommunity
//
//  Created by Oatxz on 4/2/2565 BE.
//

import SwiftUI

public struct PillShapeButton: View {
    @Binding var isDarkTheme: Bool
    private var title: String = ""
    private let titleFont: Font
    private var action: () -> ()
    private let buttonWidth: CGFloat
    private let buttonHeight: CGFloat
    private let borderWidth: CGFloat
    
    public init(title: String,
         isDarkTheme: Binding<Bool>,
         setWidth: CGFloat? = 90,
         setHeight: CGFloat? = 30,
         setFont: Font? = .system(.caption),
         setBorderWidth: CGFloat? = 1.5,
         action: @escaping () -> ()) {
        self.title = title
        _isDarkTheme = isDarkTheme
        self.buttonWidth = setWidth!
        self.buttonHeight = setHeight!
        self.borderWidth = setBorderWidth!
        self.titleFont = setFont!
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack(alignment: .center) {
                Spacer(minLength: 3)
                if self.isDarkTheme {
                    Text(title)
                        .font(titleFont)
                        .foregroundColor(.white)
                } else {
                    Text(title)
                        .font(titleFont).bold()
                        .foregroundColor(.black)
                }
                Spacer(minLength: 3)
            }
        }
        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
        .foregroundColor(self.isDarkTheme ? Color.white : Color.black)
        .background(self.isDarkTheme ? Color.black : Color.white)
        .cornerRadius(buttonHeight / 2)
        .overlay(
            RoundedRectangle(cornerRadius: buttonHeight / 2)
                .stroke(.black, lineWidth: isDarkTheme ? 0 : borderWidth)
        )
    }
}
