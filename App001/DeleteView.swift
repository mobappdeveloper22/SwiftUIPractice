//
//  DeleteView.swift
//  App001
//
//  Created by ZuhuAhmu on 09/06/2026.
//

import SwiftUI

struct DeleteView: View {
    var body: some View {
        Text("Delete Page")
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("Delete Page")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
    }
}

#Preview {
    DeleteView()
}
