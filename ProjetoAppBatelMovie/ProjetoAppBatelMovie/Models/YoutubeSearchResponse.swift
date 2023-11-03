//
//  YoutubeSearchResponse.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 03/11/23.
//

import Foundation
/*
 items =     (
             {
         etag = "QZ2UjEHZL-aqGzuDOHKCQodSVPs";
         id =             {
             kind = "youtube#video";
             videoId = uy3i3VXdYt0;
         };
         kind = "youtube#searchResult";
     },

*/

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
