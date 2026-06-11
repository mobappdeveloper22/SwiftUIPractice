//
//  APIViewModel.swift
//  App001
//
//  Created by ZuhuAhmu on 11/06/2026.
//

import Foundation

@Observable
class APIViewModel {
    
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    private let dataFetcher = DataFetcher()
    var upcomingMovies: [Title] = []
    
    private(set) var movieListStatus: FetchStatus = .notStarted
    
    func getUpcomingMovies() async {
        movieListStatus = .fetching
        
        do {
            upcomingMovies = try await dataFetcher.fetchTitles(for: "movie", by: "upcoming")
            print("upcomingMovies: \(upcomingMovies.count)")
            movieListStatus = .success
        } catch {
            print(error)
            movieListStatus = .failed(underlyingError: error)
        }
    }
}
