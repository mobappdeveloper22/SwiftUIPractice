//
//  APIView.swift
//  App001
//
//  Created by ZuhuAhmu on 11/06/2026.
//

import SwiftUI

struct APIView: View {
    
    @State private var apiNavigationPath = NavigationPath()
    @Binding var selectedTab: Int
    
    var apiViewModel = APIViewModel()
    
    var titles: [Title]
    
    var body: some View {
        
        NavigationStack(path: $apiNavigationPath) {
                
                GeometryReader { geo in
                    
                    switch apiViewModel.movieListStatus {
                    case .notStarted:
                        EmptyView()
                    case .fetching:
                        ProgressView()
                            .frame(width: geo.size.width, height: geo.size.height)
                    case .success:
                        // let _ = printLog(text: "in success mode, count: \(apiViewModel.upcomingMovies.count)")

                        List(apiViewModel.upcomingMovies) { title in
                        
                            // let _ = printLog(text: "title=\(title.title ?? "--")===")
                            
                            AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                                HStack(spacing: 0) {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(.rect(cornerRadius: 10))
//                                        .background(Color.red)
                                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                                    
                                    Text((title.name ?? title.title) ?? "")
                                        .font(.system(size: 14))
                                        .bold()
//                                        .background(Color.red)
                                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)  // ← full width
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    let _ = printLog(text: "on click on movie == \(title.title ?? "=")")
                                    apiNavigationPath.append(AppRoute.apiDetail(title))
                                }
                            } placeholder: {
                                ProgressView()
                            }
                            .listRowInsets(EdgeInsets())  // ← removes row padding
                            .listRowSeparator(.hidden)
                            
                            .frame(height: 150)
                            
                        }
                        .listStyle(.plain)
                    case .failed(let underlyingError):
                        Text(underlyingError.localizedDescription)
                            .errorMessage()
                            .frame(width: geo.size.width, height: geo.size.height)
                    }
                    
                }
                .task {
                    await apiViewModel.getUpcomingMovies()
                }
                .customNavBar(title: "API Page")
                .navigationDestination(for: AppRoute.self) { route in
                    AppRouter.destination(for: route, path: $apiNavigationPath, selectedTab: $selectedTab)
                }
        }
        
    }
    
}

#Preview {
    APIView(selectedTab: .constant(0), titles: Title.previewTitles)
}
