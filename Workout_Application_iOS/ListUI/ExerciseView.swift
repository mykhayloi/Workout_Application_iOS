//
//  WorkoutViewModel.swift
//  Palinec_Ivchenko_FinalProj
//
//  Created by Mykhaylo Ivchenko (RIT Student) on 12/9/21.
//  Created by Marko Palinec (RIT Student) on 12/9/21.
//  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
//
import SwiftUI

struct ExerciseView: View {
    
    var exercise: Exercise
    
    var body: some View {
        
        HStack (){
           
            Text(exercise.title)
                .font(.headline)
            Spacer()
            ZStack{
                Circle()
                    .fill(Color("AppColor"))
                    .frame(width: 50, height: 50)
                VStack{
                    Text("x"+exercise.reps)
                }
            }
            Spacer()
        }
    }
    
}
