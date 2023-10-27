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
    let title: String?
    let vote_count: Int
    let release_data: String?
    let vote_average: Double
}


/* {
 adult = 0;
 "backdrop_path" = "/dZbLqRjjiiNCpTYzhzL2NMvz4J0.jpg";
 "genre_ids" =             (
     27,
     53
 );
 id = 951491;
 "original_language" = en;
 "original_title" = "Saw X";
 overview = "Between the events of 'Saw' and 'Saw II', a sick and desperate John Kramer travels to Mexico for a risky and experimental medical procedure in hopes of a miracle cure for his cancer, only to discover the entire operation is a scam to defraud the most vulnerable. Armed with a newfound purpose, the infamous serial killer returns to his work, turning the tables on the con artists in his signature visceral way through devious, deranged, and ingenious traps.";
 popularity = "2879.587";
 "poster_path" = "/aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg";
 "release_date" = "2023-09-26";
 title = "Saw X";
 video = 0;
 "vote_average" = "7.3";
 "vote_count" = 348;
 },*/
