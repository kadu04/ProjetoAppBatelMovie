//
//  MovieService.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 27/10/23.
//

import Foundation
import UIKit

// APICaller

struct Constants {
    static let API_KEY = "13ccb471f6dae518c380ea180bcff7d3"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class MovieService {
    static let shared = MovieService()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MovieTitleResponse.self, from: data)
                completion(.success(results.results))

            } catch {
                print(error.localizedDescription)
            }
            

        
    }
