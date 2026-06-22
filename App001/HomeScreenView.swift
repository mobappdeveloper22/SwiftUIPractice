//
//  HomeScreenView.swift
//  App001
//
//  Created by ZuhuAhmu on 03/06/2026.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State private var navigationPath = NavigationPath()
    
    @Binding var selectedTab: Int
    
    var body: some View {
        
        NavigationStack(path: $navigationPath) {
            VStack {
                HStack {
                    Button {
                        print("\(Constants.topLeftText) button clicked")
                        navigationPath.append(AppRoute.buttonEvent(Constants.topLeftText))
                    } label: {
                        Text(Constants.topLeftText)
                            .homeButtonUI()
                    }
                    Spacer()
                    Button {
                        print("\(Constants.topRightText) button clicked")
                        navigationPath.append(AppRoute.buttonEvent(Constants.topRightText))

                    } label: {
                        Text(Constants.topRightText)
                            .homeButtonUI()
                    }
                }
                Spacer()
                Button {
                    print("\(Constants.centerText) button clicked")
                    navigationPath.append(AppRoute.buttonEvent(Constants.centerText))

                } label: {
                    Text(Constants.centerText)
                        .homeButtonUI()
                }
                Spacer()
                HStack {
                    Button {
                        print("\(Constants.bottomLeftText) button clicked")
                        navigationPath.append(AppRoute.buttonEvent(Constants.bottomLeftText))

                    } label: {
                        Text(Constants.bottomLeftText)
                            .homeButtonUI()
                    }
                    Spacer()
                    Button {
                        print("\(Constants.bottomRightText) button clicked")
                        navigationPath.append(AppRoute.buttonEvent(Constants.bottomRightText))

                    } label: {
                        Text(Constants.bottomRightText)
                            .homeButtonUI()
                    }
                }
            }
            .padding()
            // below is useless as we are using custom now
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("delete button clicked")
                        navigationPath.append(AppRoute.deleteButtonEvent)

                    }) {
                        Image(systemName: "trash")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Home Page")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("search button clicked")
                        navigationPath.append(AppRoute.searchButtonEvent("Search"))

                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: AppRoute.self) { route in
                AppRouter.destination(for: route, path: $navigationPath, selectedTab: $selectedTab)
            }
            .customNavBar(title: "Home Page", showDelete: true, showSearch: true, onDelete: {
                print("delete button clicked")
                navigationPath.append(AppRoute.deleteButtonEvent)
            }, onSearch: {
                print("search button clicked")
                navigationPath.append(AppRoute.searchButtonEvent("Search"))
            })

        }
    }
}

#Preview {
    HomeScreenView(selectedTab: .constant(0))
}
