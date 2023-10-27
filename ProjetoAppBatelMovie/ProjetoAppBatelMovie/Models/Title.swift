//
//  Title.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 27/10/23.
//

import Foundation

struct MovieTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_data: String?
    let vote_average: Double
}
