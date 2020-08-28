//
//  NetworkingTest.swift
//  NikeTop100Tests
//
//  Created by Abdul Diallo on 8/28/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import XCTest
@testable import NikeTop100

class NetworkingTest: XCTestCase {
    
    let badEndpoint = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
    let goodEndpoint = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testGivenBadURL_SouldReturn_URLFailed() {
        NetworkService.shared.getTopHundredAlbums(withEndpoint: badEndpoint) { result in
            switch result {
            case .success(let albums):
                XCTAssertNil(albums)
            case .failure(let error):
                XCTAssertEqual(error.description, NetworkError.urlFailed.description)
            }
        }
    }

    
    func testGivenRightURL_ShouldReturn_Albums() {
        NetworkService.shared.getTopHundredAlbums(withEndpoint: goodEndpoint) { result in
            switch result {
            case .success(let albums):
                XCTAssertEqual(albums.count, 100)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
    
    func testDownloadImage_MustReturnNoImage() {
        guard let badURL = URL.init(string: badEndpoint) else { return }
        NetworkService.shared.downloadImage(withURL: badURL) { image in
            XCTAssertNil(image)
        }
    }
    
    func testDownloadImage_MustReturnImage() {
        guard let URL = URL.init(string: "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/6b/16/05/6b16053c-e27c-98e2-199c-976303f7ed8a/075679803160.jpg/200x200bb.png") else { return }
        NetworkService.shared.downloadImage(withURL: URL) { image in
            XCTAssertNotNil(image)
        }
    }

}
