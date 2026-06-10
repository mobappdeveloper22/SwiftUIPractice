//
//  AppRouter.swift
//  App001
//
//  Created by ZuhuAhmu on 10/06/2026.
//

import SwiftUI

struct AppRouter {
    @ViewBuilder
    static func destination(for route: AppRoute, path: Binding<NavigationPath>) -> some View {
        switch route {
        case .buttonEvent(let text):
            HomeDetailsView(navigationPath: path, title: text)
        case .deleteButtonEvent:
            DeleteView()
        case .searchButtonEvent(let query):
            SearchView()
        case .homeDetailsButton(let text):
            FinalDetailsView(navigationPath: path, title: text)
        default:
            EmptyView()
        }
    }
    
}
