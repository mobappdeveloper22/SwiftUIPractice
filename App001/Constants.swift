//
//  Constants.swift
//  App001
//
//  Created by ZuhuAhmu on 09/06/2026.
//

import Foundation
import SwiftUI

struct Constants {
    
    // tab bar
    static let homeTabText = "Home"
    static let homeTabImage = "house.fill"
    static let apiTabText = "API"
    static let apiTabImage = "arrow.right.arrow.left"
    static let threeTabText = "Tab3"
    static let threeTabImage = "checkmark.seal"
    
    static let topLeftText = "Top Left"
    static let topRightText = "Top Right"
    static let centerText = "Center"
    static let bottomLeftText =  "Bottom Left"
    static let bottomRightText = "Bottom Right"
    static let clickMeText = "Click Me!!!"
    
    static let testTitleURL1 = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
    static let testTitleURL2 = "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
    static let testTitleURL3 = "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
    static let testTitleURL4 = "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
    static let testTitleURL5 = "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
    static let testTitleURL6 = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"

    static let posterURLStart = "https://image.tmdb.org/t/p/w500"
    
    static func addPosterPath(to titles: inout[Title]) {
        for index in titles.indices {
            if let path = titles[index].posterPath {
                titles[index].posterPath = Constants.posterURLStart + path
            }
        }
    }
    
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

extension Text {
    func errorMessage() -> some View {
        self
            .foregroundStyle(.red)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 10))
    }
}

func printLog(text : String) {
    print("fapa==\(text)")
}
