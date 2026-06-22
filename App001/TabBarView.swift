//
//  TabBarView.swift
//  App001
//
//  Created by ZuhuAhmu on 11/06/2026.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            Tab(Constants.homeTabText, systemImage: Constants.homeTabImage, value: 0) {
                HomeScreenView(selectedTab: $selectedTab)
            }
            
            Tab(Constants.apiTabText, systemImage: Constants.apiTabImage, value: 1) {
                APIView(selectedTab: $selectedTab, titles: Title.previewTitles)
            }
            
            Tab(Constants.threeTabText, systemImage: Constants.threeTabImage, value: 2) {
                HomeScreenView(selectedTab: $selectedTab)
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
