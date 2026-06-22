//
//  FinalDetailsView.swift
//  App001
//
//  Created by ZuhuAhmu on 09/06/2026.
//

import SwiftUI

struct FinalDetailsView: View {
    
    @Binding var navigationPath: NavigationPath
    @Binding var selectedTab: Int
    
    let title : String
    
    var body: some View {
        
        VStack {
            Spacer()
                .frame(height: 10)
            Text("Final Details page...")
            Spacer()
                .frame(height: 10)
            Text("\(title) Page")
            Spacer()
            
            HStack {
                Button {
                    selectedTab = 0
                } label: {
                    Text("Go to Tab 1")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button {
                    selectedTab = 1
                } label: {
                    Text("Go to Tab 2")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to Tab 3")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
        }
        .customNavBar(title: "\(title) Page", showBack: true)
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Final \(title) Page")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
    }
}

#Preview {
    FinalDetailsView(navigationPath: .constant(NavigationPath()), selectedTab: .constant(0), title: "FinalView")
}
