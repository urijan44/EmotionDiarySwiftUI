//
//  EmotionTest.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import XCTest
@testable import EDKit

final class EmotionTest: XCTestCase {

  var sut: Emotion!

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = Emotion()
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  func testEmotion_whenInitEmotion_hasTitle() {
    // Given
    // When

    // Then
    XCTAssertEqual(sut.title, "")
  }

  func testEmotion_whenInitEmotion_hasCount() {
    // Given
    // When

    // Then
    XCTAssertEqual(sut.count, 0)
  }

  func testEmotion_whenInitEmotion_hasImageURL() {
    // Given
    // When

    // Then
    XCTAssertEqual(sut.imageURL, "")
  }

  func testEmotion_whenAddCount_countIncreased() {
    // Given
    sut.increase()
    let expectedResult = 1
    // When

    // Then
    XCTAssertEqual(sut.count, expectedResult)
  }

  func testEmotion_setImageUrl() {
    // Given
    sut.changeImage(urlString: "imageurl")
    // When

    // Then
    XCTAssertEqual(sut.imageURL, "imageurl")
  }

  func testEmotion_setTitle_changeTitle() {
    // Given
    sut.setTitle(title: "즐거워")
    // When

    // Then
    XCTAssertEqual(sut.title, "즐거워")
  }
}
