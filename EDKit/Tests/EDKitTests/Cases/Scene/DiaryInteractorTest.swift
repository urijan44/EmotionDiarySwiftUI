//
//  DiaryInteractorTest.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import XCTest
@testable import EDKit

final class DiaryInteractorTest: XCTestCase {
  var sut: DiaryInteractor!
  var presenterSpy: DiaryPresentaitonLogic!

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = DiaryInteractor()
    presenterSpy = SpyDiaryPresenter()
    sut.presenter = presenterSpy
  }

  override func tearDownWithError() throws {
    sut.presenter = nil
    sut = nil
    presenterSpy = nil
    try super.tearDownWithError()
  }
}
