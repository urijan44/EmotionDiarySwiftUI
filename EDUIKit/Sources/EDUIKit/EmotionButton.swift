//
//  EmotionButton.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import SwiftUI
import Combine

public struct EmotionButton: View {

  //MARK: - Properties
  var image: () -> Image
  var title: String
  @State var countText: String = "0"
  @Binding var count: Int {
    didSet {
      updateCountLabel()
    }
  }

  public var body: some View {
    VStack {
      image()
        .resizable()
        .aspectRatio(contentMode: .fit)
      HStack{
        Text(title)
        Text(countText)
      }
    }
    .onTapGesture {
      count += 1
    }
  }


  //MARK: - Methods
  public init(
    title: String,
    count: Binding<Int>,
    @ViewBuilder image: @escaping () -> Image) {
      self.title = title
      self._count = count
      self.image = image
    }

  private func updateCountLabel() {
    countText = count > 1000 ? "999" : "\(count)"
  }

}

struct EmotionButton_Previews: PreviewProvider {
  static var previews: some View {
    EmotionButton(
      title: "즐거워",
      count: .constant(100)) {
        Image(systemName: "heart")
      }
  }
}
