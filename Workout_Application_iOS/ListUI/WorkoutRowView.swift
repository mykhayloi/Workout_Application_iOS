//
//  WorkoutViewModel.swift
//  Palinec_Ivchenko_FinalProj
//
//  Created by Mykhaylo Ivchenko (RIT Student) on 12/9/21.
//  Created by Marko Palinec (RIT Student) on 12/9/21.
//  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
//

import SwiftUI

struct WorkoutRowView: View {
    @ObservedObject var workoutViewModel: WorkoutViewModel
    @ObservedObject var quoteViewModel: QuotesViewModel
    
    var workout: Workout
    @State var isTapped = false
   
    let randInt = Int.random(in: 1..<9)
   
    
    var body: some View {
        ZStack{
            
        HStack{
            
            VStack(alignment: .leading){
                Text(workout.title)
                    .fontWeight(.heavy)
                    .lineLimit(2)
                    .font(.system(size: 80))
                    .foregroundColor(Color.white)
                    .frame(width: 300)
                    .offset(x: -50)

                
            }
            .foregroundColor(.black)
            Spacer()

        }.zIndex(1)
        

            NavigationLink("",
                destination: WorkoutDetailView(quoteModel: quoteViewModel, workoutModel: workoutViewModel, workout: workout),
                isActive: $isTapped
            )
            .foregroundColor(Color(UIColor.red))
            
        .frame(width: nil, height: 200)
        .padding()
        .background(
            
            
            
            Image("workout\(randInt)")
            .resizable()
                .frame(width: 400, height: 225)
            .cornerRadius(7)
            .shadow(radius: 8)
            
        )
            
        }
    }
}
