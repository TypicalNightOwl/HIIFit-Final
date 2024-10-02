//
//  HistoryStoreDevData.swift
//  HIIFit
//
//  Created by Ryan Westhoelter on 9/12/24.
//

import Foundation

extension HistoryStore {
    func createDevData() {
        
        exerciseDays = [
            ExerciseDay(
                date: Date().addingTimeInterval(-86400),
                exercises: [
                    Exercise.exercises[0].exerciseName,
                    Exercise.exercises[1].exerciseName,
                    Exercise.exercises[2].exerciseName,
                    Exercise.exercises[0].exerciseName,
                    Exercise.exercises[0].exerciseName
                ]),
            ExerciseDay(
                date: Date().addingTimeInterval(-86400 * 3),
                exercises: [
                    Exercise.exercises[2].exerciseName,
                    Exercise.exercises[2].exerciseName,
                    Exercise.exercises[3].exerciseName
                ]),
            ExerciseDay(
                date: Date().addingTimeInterval(-86400 * 4),
                exercises: [
                    Exercise.exercises[1].exerciseName,
                    Exercise.exercises[1].exerciseName
                ]),
            ExerciseDay(
                date: Date().addingTimeInterval(-86400 * 5),
                exercises: [
                    Exercise.exercises[0].exerciseName,
                    Exercise.exercises[1].exerciseName,
                    Exercise.exercises[3].exerciseName,
                    Exercise.exercises[3].exerciseName
                ])
        ]
    }
    
    
    func copyHistoryTestData() {
        let filename = "history.plist"
        if let resourceURL = Bundle.main.resourceURL {
            let sourceURL = resourceURL.appending(component: filename)
            let documentsURL = URL.documentsDirectory
            let destinationURL = documentsURL.appending(component: filename)
            do {
                try FileManager.default.copyItem(at: sourceURL, to: destinationURL)
            } catch {
                print("Failed to copy", filename)
            }
            print("Sample History data copied to Documents directory")
        }
    }
    
    
    func createHistoryTestData() {
        print("Data construction started")
        exerciseDays = []
        let numberOfDays: Int = 720
        for day in 0..<numberOfDays {
            guard let date =
                    Calendar.current.date(byAdding: .day, value: -day, to: Date())
            else {
                continue
            }
            var exerciseNames: [String] = []
            
            for _ in 0..<Int.random(in: 0...5) {
                for exercise in Exercise.exercises {
                    if Bool.random() {
                        exerciseNames.append(exercise.exerciseName)
                    }
                }
            }
            if !exerciseNames.isEmpty {
                exerciseDays.append(ExerciseDay(date: date, exercises: exerciseNames))
            }
        }
        try? save()
        print("Data construction completed")
    }
}
