//
//  HeaderView.swift
//  HIIFit
//
//  Created by Ryan Westhoelter on 9/12/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    let titletext: String
    
    var body: some View {
        VStack {
            Text(titletext)
                .font(.largeTitle)
            
            HStack {
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                
                    let fill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index + 1).circle\(fill)")
                        .onTapGesture{
                            selectedTab = index
                        }
                }
            }
            .font(.title2)
        }
    }
}


#Preview {
    HeaderView(selectedTab: .constant(0), titletext: "Squat")
        .previewLayout(.sizeThatFits)
}
