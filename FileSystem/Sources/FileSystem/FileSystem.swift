import Foundation

public final class FileSystem {

  //MARK: - Properties
  public private(set) var defaultURL: URL! = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Emotion", isDirectory: true)
  private let fileName = "EmotionDiary.json"
  private let fileManager = FileManager.default

  //MARK: - Methods
  public init() throws {
    do {
      try fileManager.createDirectory(atPath: defaultURL.path, withIntermediateDirectories: true)
    } catch let error {
      throw error
    }
  }

  public func save(data: Data) throws {
    do {
      try data.write(to: defaultURL.appendingPathComponent(fileName))
    } catch let error {
      throw error
    }
  }

  public func load() throws -> Data {
    do {
      let data = try Data(contentsOf: defaultURL.appendingPathComponent(fileName), options: .alwaysMapped)
      return data
    } catch let error {
      throw error
    }
  }
}
