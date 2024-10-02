//
//  RaisedButton.swift
//  HIIFit
//
//  Created by Ryan Westhoelter on 9/28/24.
//

import SwiftUI

struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(buttonText)
                .raisedButtonTextStyle()
        })
        .buttonStyle(.raised)
    }
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 12)
            .background(
            Capsule()
                .foregroundColor(Color("background"))
                .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
                .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
            )
    }
}

struct RaisedButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RaisedButton(buttonText: "Get Started") {
                print("Hello World")
            }
            .background(Color("background"))
            .previewLayout(.sizeThatFits)
        }
    }
}
    
    extension Text {
        func raisedButtonTextStyle() -> some View {
            self
                .font(.body)
                .fontWeight(.bold)
        }
    }
    
    extension ButtonStyle where Self == RaisedButtonStyle {
        static var raised: RaisedButtonStyle {
            .init()
        }
    }
    

