//
//  AppRouter.swift
//  App001
//
//  Created by ZuhuAhmu on 10/06/2026.
//

import SwiftUI

struct AppRouter {
    @ViewBuilder
    static func destination(for route: AppRoute, path: Binding<NavigationPath>, selectedTab: Binding<Int>) -> some View {
        switch route {
        case .buttonEvent(let text):
            HomeDetailsView(navigationPath: path, selectedTab: selectedTab, title: text)
        case .deleteButtonEvent:
            DeleteView()
        case .searchButtonEvent(let query):
            SearchView()
        case .homeDetailsButton(let text):
            FinalDetailsView(navigationPath: path, selectedTab: selectedTab, title: text)
        case .apiDetail(let title):
            APIDetailView(title: title, selectedTab: selectedTab)
        }
    }
    
}
