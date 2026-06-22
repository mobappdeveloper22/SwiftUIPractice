//
//  APIDetailView.swift
//  App001
//
//  Created by ZuhuAhmu on 22/06/2026.
//

import SwiftUI

struct APIDetailView: View {
    
    let title: Title
    @Binding var selectedTab: Int
    
    var titleName: String {
        return (title.name ?? title.title) ?? ""
    }
    
    var body: some View {

        GeometryReader { geo in
            VStack(spacing: 0) {
                
                ScrollView {
                    AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width, height: geo.size.width*1.5)
                    
                    
                    Spacer()
                        .frame(height: 10)
                    Text(titleName)
                        .font(.system(size: 24))
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Text(title.overview ?? "")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                        .border(.blue, width: 5)
                    
                    Spacer()
                        .frame(height: 15)
                    
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
                .ignoresSafeArea(edges: .top)
                
            }
            
        }
        
    }
}

#Preview {
    APIDetailView(title: Title.previewTitles[0], selectedTab: .constant(0))
}
