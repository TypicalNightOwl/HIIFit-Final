//
//  WelcomeView.swift
//  HIIFit
//
//  Created by Ryan Westhoelter on 9/11/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showHistory = false
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView(selectedTab: $selectedTab, titletext: "Welcome")
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory){
                    HistoryView(showHistory: $showHistory)
                }
                    .padding(.bottom)
            }
            
            VStack{
                HStack (alignment: .bottom){
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    Image("step-up")
                        //.resizable()
                        //.aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        //.frame(width: 240.0, height: 240.0)
                        .resizedToFill(width: 240, height: 240)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                
                Button(action: {selectedTab = 0}) {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
                    
                }
                .font(.title2)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 2))
            }
        }
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
