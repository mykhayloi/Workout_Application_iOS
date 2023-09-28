//
//  WorkoutViewModel.swift
//  Palinec_Ivchenko_FinalProj
//
//  Created by Mykhaylo Ivchenko (RIT Student) on 12/9/21.
//  Created by Marko Palinec (RIT Student) on 12/9/21.
//  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
//

import Foundation

class WorkoutViewModel: ObservableObject{
    
    @Published private(set) var data: [Workout] = []

    
    private var workouts: [Workout] = Workout.mock {
        didSet{
            refreshData()
        }
    }
    
    init() {
        refreshData()
    }
    
    func refreshData() {
        data = workouts
    }
    
    func create(title: String, exercises: [Exercise]) {
        workouts.append(Workout(title: title, exercises: exercises))
    }
    
    func deleteWorkout(workout: Workout) {
        guard let index = workouts.firstIndex(where: { $0.id == workout.id}) else {
            return
        }
        print(index)

    }
    
}
