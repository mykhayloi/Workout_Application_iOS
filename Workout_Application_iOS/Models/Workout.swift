//
//  WorkoutViewModel.swift
//  Palinec_Ivchenko_FinalProj
//
//  Created by Mykhaylo Ivchenko (RIT Student) on 12/9/21.
//  Created by Marko Palinec (RIT Student) on 12/9/21.
//  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
//

import Foundation

struct Workout: Codable, Identifiable{
    var id = UUID()
    var title: String
    var exercises: [Exercise]
}

extension Workout {
    static var mock: [Workout] = [
      Workout(title: "Arm day",
              exercises: [Exercise(title: "Pushups", reps: "20"), Exercise(title: "pullups", reps: "10")]),
        Workout(title: "Leg Day",
                exercises: [Exercise(title: "squats", reps: "20"), Exercise(title: "lunges", reps: "10")])
    ]
}
