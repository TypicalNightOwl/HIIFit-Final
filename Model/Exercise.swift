//
//  Exercise.swift
//  HIIFit
//
//  Created by Ryan Westhoelter on 9/12/24.
//

import Foundation

struct Exercise {
    let exerciseName: String
    let videoName: String
    
    enum ExerciseEnum: String {
        case squat = "Squat"
        case stepUp = "Step Up"
        case burpee = "Burpee"
        case sunSalute = "Sun Salute"
    }
}

extension Exercise {
    static let exercises = [
    
    Exercise(
        exerciseName: ExerciseEnum.squat.rawValue,
        videoName: "squat"),
    Exercise(
        exerciseName: ExerciseEnum.stepUp.rawValue,
        videoName: "step-up"),
    Exercise(
        exerciseName: ExerciseEnum.burpee.rawValue,
        videoName: "burpee"),
    Exercise(
        exerciseName: ExerciseEnum.sunSalute.rawValue,
        videoName: "sun-salute")
    ]
    
    static let names: [String] = [
        ExerciseEnum.squat.rawValue,
        ExerciseEnum.stepUp.rawValue,
        ExerciseEnum.burpee.rawValue,
        ExerciseEnum.sunSalute.rawValue
    ]
}
