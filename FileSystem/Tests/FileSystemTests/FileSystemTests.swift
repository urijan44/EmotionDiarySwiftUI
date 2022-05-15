import XCTest
@testable import FileSystem

final class FileSystemTests: XCTestCase {

  var sut: FileSystem!
  let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = try! FileSystem()
    print(sut.defaultURL)
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  func testSystem_hasDefaultURL() {
    // Given

    // When

    // Then
    XCTAssertNotNil(sut.defaultURL)
  }

  func testSystem_initSystem_hasContainerDir() {
    // Given

    // When

    // Then

    XCTAssertTrue(FileManager.default.fileExists(atPath: sut.defaultURL.path))
  }

  func testSystem_whenSaveData_success() {
    // Given
    let data = Data()
    do {
      // When
      try sut.save(data: data)
      // Then
      XCTAssert(true)
    } catch let error {
      // Then
      XCTAssert(false, error.localizedDescription)
    }
  }

  func testSystem_whenLoadData_success() {
    // Given
    do {
      let _ = try sut.load()
      XCTAssert(true)
    } catch let error {
      XCTAssert(false, error.localizedDescription)
    }
    // When

    // Then
  }
}
