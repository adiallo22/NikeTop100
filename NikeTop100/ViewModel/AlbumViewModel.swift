//
//  AlbumViewModel.swift
//  NikeTop100
//
//  Created by Abdul Diallo on 8/28/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import Foundation

struct AlbumViewModel {
    
    private let album : Album
    
    var name : String {
        return album.name
    }
    
    var artist : String {
        return album.artist
    }
    
    var thumbnail : URL? {
        guard let url = URL.init(string: album.thumbnail) else { return nil }
        return url
    }
    
    var copyright : String {
        return album.copyright
    }
    
    var genre : String {
        return album.genre
    }
    
    var releaseDate : String {
        return album.releaseDate
    }
    
    var url : String {
        return album.url
    }
    
    init(album: Album) {
        self.album = album
    }
    
}
