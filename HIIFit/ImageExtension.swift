//
//  ImageExtension.swift
//  HIIFit
//
//  Created by Ryan Westhoelter on 9/12/24.
//

import SwiftUI

extension Image {
 
  func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: width, height: height)
  }
}
