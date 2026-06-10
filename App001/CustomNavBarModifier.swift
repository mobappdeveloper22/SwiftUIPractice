//
//  CustomNavBarModifier.swift
//  App001
//
//  Created by ZuhuAhmu on 10/06/2026.
//

import SwiftUI

struct CustomNavBarModifier: ViewModifier {
    let title: String
    var showBack: Bool = false
    var showDelete: Bool = false
    var showSearch: Bool = false
    var onDelete: (() -> Void)? = nil
    var onSearch: (() -> Void)? = nil
    
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            HStack {
                // Left
                if showBack {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                    }
                } else if showDelete {
                    Button { onDelete?() } label: {
                        Image(systemName: "trash").foregroundColor(.red)
                    }
                }
                
                Spacer()
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                // Right
                if showSearch {
                    Button { onSearch?() } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 44)
            .background(Color(.systemBackground))
            .overlay(Divider(), alignment: .bottom)
            
            content
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

extension View {
    func customNavBar(
        title: String,
        showBack: Bool = false,
        showDelete: Bool = false,
        showSearch: Bool = false,
        onDelete: (() -> Void)? = nil,
        onSearch: (() -> Void)? = nil
    ) -> some View {
        modifier(CustomNavBarModifier(
            title: title,
            showBack: showBack,
            showDelete: showDelete,
            showSearch: showSearch,
            onDelete: onDelete,
            onSearch: onSearch
        ))
    }
}
