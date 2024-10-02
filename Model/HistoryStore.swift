//
//  HistoryStore.swift
//  HIIFit
//
//  Created by Ryan Westhoelter on 9/12/24.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
    var uniqueExercises: [String] {
        Array(Set(exercises)).sorted(by: <)
    }
    
    func countExercise(exercise: String) -> Int {
        exercises.filter { $0 == exercise }.count
    }
}


class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    @Published var loadingError = false
    
    
    enum FileError: Error {
        case loadFailure
        case saveFailure
    }
    
    init(preview: Bool = false) {
        do {
            try load()
        } catch {
            loadingError = true
        }
        #if DEBUG
        if preview {
            createDevData()
        } else {
            if exerciseDays.isEmpty {
                copyHistoryTestData()
                try? load()
            }
        }
        #endif
    }
    
    var dataURL: URL {
        URL.documentsDirectory
            .appendingPathComponent("history.plist")
    }
    
    func load() throws {
        guard let data = try? Data(contentsOf: dataURL) else {
            return
        }
        do {
            let plistData = try PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil)
            let convertedPlistData = plistData as? [[Any]] ?? []
            
            exerciseDays = convertedPlistData.map {
                ExerciseDay(
                    date: $0[1] as? Date ?? Date(),
                    exercises: $0[2] as? [String] ?? [])
            }
        } catch {
            throw FileError.loadFailure
        }
    }
    
    func save() throws {
        let plistData = exerciseDays.map {
            [$0.id.uuidString, $0.date, $0.exercises]
        }
        
        do{
            let data = try PropertyListSerialization.data(
            fromPropertyList: plistData,
            format: .binary,
            options: .zero)
            
            try data.write(to: dataURL, options: .atomic)
        } catch {
            throw FileError.saveFailure
        }
    }
    
    func addExercise(date: Date, exerciseName: String) {
        let exerciseDay = ExerciseDay(date: date, exercises: [exerciseName])
        
        if let index = exerciseDays.firstIndex(
            where: { $0.date.yearMonthDay <= date.yearMonthDay }) {
            if date.isSameDay(as: exerciseDays[index].date) {
                exerciseDays[index].exercises.append(exerciseName)
            } else {
                exerciseDays.insert(exerciseDay, at: index)
            }
        } else {
            exerciseDays.append(exerciseDay)
        }
        try? save()
    }
    
    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) {
            print("Adding \(exerciseName)")
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(
                ExerciseDay(date: today, exercises: [exerciseName]),
                at: 0)
        }
        print("History: ", exerciseDays)
        
        do {
        try save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

