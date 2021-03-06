//
//  AlbumData.swift
//  NikeTop100
//
//  Created by Abdul Diallo on 8/28/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

struct AlbumJSON : Codable {
    
    struct FeedJSON : Codable {
        struct Result : Codable {
            var artistName : String
            var artworkUrl100 : String
            var releaseDate : String
            struct Genre : Codable {
                var name : String
            }
            var name : String
            var genres : [Genre]
            var url : String
            var copyright : String?
        }
        var results : [Result]
    }
    var feed : FeedJSON
    
}
