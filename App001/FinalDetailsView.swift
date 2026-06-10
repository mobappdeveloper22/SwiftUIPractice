//
//  FinalDetailsView.swift
//  App001
//
//  Created by ZuhuAhmu on 09/06/2026.
//

import SwiftUI

struct FinalDetailsView: View {
    
    @Binding var navigationPath: NavigationPath
    
    let title : String
    
    var body: some View {
        
        Text("Final Details page...")
        Spacer()
            .frame(height: 10)
        Text("\(title) Page")
        Spacer()
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
    FinalDetailsView(navigationPath: .constant(NavigationPath()), title: "FinalView")
}
