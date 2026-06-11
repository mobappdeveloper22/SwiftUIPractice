//
//  TabBarView.swift
//  App001
//
//  Created by ZuhuAhmu on 11/06/2026.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            
            Tab(Constants.homeTabText, systemImage: Constants.homeTabImage) {
                HomeScreenView()
            }
            
            Tab(Constants.apiTabText, systemImage: Constants.apiTabImage) {
                APIView(titles: Title.previewTitles)
            }
            
            Tab(Constants.threeTabText, systemImage: Constants.threeTabImage) {
                HomeScreenView()
            }
            
        }
        .onAppear {
            if let config = APIConfig.shared {
                print(config.tmdbBaseURL)
                print(config.tmdbAPIKey)
            }
            
        }
    }
}

#Preview {
    TabBarView()
}
