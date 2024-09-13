//
//  ExerciseView.swift
//  HIIFit
//
//  Created by Ryan Westhoelter on 9/11/24.
//

import SwiftUI

struct ExerciseView: View {
    @State private var showSuccess = false
    @State private var showHistory = false
    @State private var rating = 0
    @Binding var selectedTab: Int
    let index: Int
    
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var startButton: some View {
        Button("Start Exercise") {}
    }
    
    var doneButton: some View {
        Button("Done") {
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
        }
    }
    
    let interval: TimeInterval = 30
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titletext: exercise.exerciseName)
                    .padding(.bottom)
                
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)
                
                
                Text(Date().addingTimeInterval(interval) , style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                
                
                HStack(spacing: 150) {
                    startButton
                    doneButton
                        .sheet(isPresented: $showSuccess){
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        }
                }
                
                RatingView(rating: $rating)
                    .padding()
                
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(3), index: 3)
}

