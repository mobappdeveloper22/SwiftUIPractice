//
//  Constants.swift
//  App001
//
//  Created by ZuhuAhmu on 09/06/2026.
//

import Foundation
import SwiftUI

struct Constants {
    static let topLeftText = "Top Left"
    static let topRightText = "Top Right"
    static let centerText = "Center"
    static let bottomLeftText =  "Bottom Left"
    static let bottomRightText = "Bottom Right"
    static let clickMeText = "Click Me!!!"
}

extension Text {
    func homeButtonUI() -> some View {
        self
            .frame(width: 160, height: 75)
            .font(.system(size: 24, weight: .semibold))
            .foregroundStyle(.buttonText)
            .bold()
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.buttonBorder,lineWidth:3)
            }
    }
}
