//
//  URL+ExtensionTests.swift
//  CommunityTests
//
//  Created by Surasit Intawong on 17/12/2564 BE.
//

import XCTest

@testable import Community
class URL_ExtensionTests: XCTestCase {
    
    private let mockValidURL: String = "https://stg-avatar.dmpcdn.com/p80x80/default.png"
    private let mockInvalidURL: String = "stg-avatar"
    
    func testValidURLTypeShouldBeTrue() {
        let validURL = URL(string: mockValidURL)!.isValidURL
        XCTAssertTrue(validURL)
    }
    
    func testInvalidURLTypeFailShouldBeFalse() {
        let invalidURL = URL(string: mockInvalidURL)!.isValidURL
        XCTAssertFalse(invalidURL)
    }
}
