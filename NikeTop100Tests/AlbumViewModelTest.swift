//
//  AlbumViewModelTest.swift
//  NikeTop100Tests
//
//  Created by Abdul Diallo on 8/28/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import XCTest
@testable import NikeTop100

class AlbumViewModelTest: XCTestCase {
    
    var vm : AlbumViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let album = Album.init(name: "hello",
                               artist: "adele",
                               thumbnail: "image",
                               copyright: "adele copyright",
                               releaseDate: "2014",
                               genre: "pop",
                               url: "url")
        vm = AlbumViewModel(album: album)
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testViewModel_Returning_RightPropreties() {
        if let vm = vm {
            XCTAssertEqual(vm.artist, "adele")
            XCTAssertEqual(vm.name, "hello")
            XCTAssertEqual(vm.copyright, "adele copyright")
            XCTAssertEqual(vm.genre, "pop")
            XCTAssertEqual(vm.releaseDate, "2014")
            XCTAssertEqual(vm.url, "url")
            XCTAssertEqual(vm.thumbnail, URL(string: "image"))
        }
    }

}
