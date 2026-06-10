//
//  HomeDetailsView.swift
//  App001
//
//  Created by ZuhuAhmu on 09/06/2026.
//

import SwiftUI

struct HomeDetailsView: View {
    
    // @State private var homeDetailsViewNavigationPath = NavigationPath()
    @Binding var navigationPath: NavigationPath
    
    let title : String

    
    var body: some View {
        
        VStack {
            
            Text("Coming from \(title)")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(.green)
                .italic()
                .underline()
            
            Spacer()
                .frame(height: 20)
            
            Button {
                print("\(Constants.clickMeText) button clicked")
                navigationPath.append(AppRoute.homeDetailsButton(title))
                
            } label: {
                Text(Constants.clickMeText)
                    .homeButtonUI()
            }
            
            Spacer()
            
        }
        .customNavBar(title: "\(title) Page", showBack: true)
        
        .toolbar {
            
            ToolbarItem(placement: .principal) {
                Text("\(title) Page")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
        }
        
    }
    
}

#Preview {
    HomeDetailsView(navigationPath: .constant(NavigationPath()), title: "title_comes_here")
}
