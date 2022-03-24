//
//  Dictionary+ExtensionTests.swift
//  CommunityTests
//
//  Created by Surasit Intawong on 8/3/2565 BE.
//

import XCTest

@testable import Community
class Dictionary_ExtensionTests: XCTestCase {
    
    private var userInfoDataMock: Data?
    private var userInfoDictionaryMock: [String: String]?
    
    override func setUpWithError() throws {
        // Mock setup json string convert to type data.
        let jsonString = "{\"data\":{\"postId\":\"4519834adf44eb51dc06359cc9e52376\",\"eventName\":\"post.created\",\"communityId\":\"56701fa0443c1e92b43d89961fdc0cd4\",\"userId\":\"21999389\"},\"aps\":{\"alert\":{\"title\":\"เค้กวันเกิด สไตล์มินิมอล\",\"body\":\"BenzzzMod created new post in your community.\"},\"sound\":\"default\",\"content-available\":1}}"
        let jsonData = jsonString.data(using: .utf8)!
        self.userInfoDataMock = jsonData
        
        // Mock setup json string convert to type dictionary
        let anyResult: Any = try JSONSerialization.jsonObject(with: jsonData, options: [])
        self.userInfoDictionaryMock = anyResult as? [String: String] ?? [:]
    }

    func testConvertDataTypeFromDictionary_ShouldBeDictionary() throws {
        let result: Data? = self.userInfoDictionaryMock?.dataFromDictionary()
        XCTAssertNotNil(result)
    }
    
    func testTransformData_IsNotExistParameter_ShouldBeNil() throws {
        let result = self.userInfoDictionaryMock?.transformData(data: nil, model: CommunityPushNotificationModel.self)
        XCTAssertNil(result)
    }
    
    func testTransformData_ShouldBeSetToSpecificModel() throws {
        let result = self.userInfoDictionaryMock?.transformData(data: self.userInfoDataMock, model: CommunityPushNotificationModel.self)
        XCTAssertNotNil(result)
        XCTAssert((result as Any) is CommunityPushNotificationModel)
    }
}
