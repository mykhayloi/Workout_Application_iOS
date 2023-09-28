//
//  WorkoutViewModel.swift
//  Palinec_Ivchenko_FinalProj
//
//  Created by Mykhaylo Ivchenko (RIT Student) on 12/9/21.
//  Created by Marko Palinec (RIT Student) on 12/9/21.
//  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    @ObservedObject var quoteModel = QuotesViewModel()
    @ObservedObject var workoutModel: WorkoutViewModel
    var workout: Workout
    var exercises: [Exercise]{
        return workout.exercises
    }
    var quote: Quote{
        quoteModel.data ?? Quote(id: "1",author: "oops",en: "no")
    }
    var index = Int.random(in: 1..<10)
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                VStack{
            
                Text("Todays exercises")
                    .font(.system(size: 30))
                                     
                List{
                    ForEach(exercises){ exercise in
                            ExerciseView(exercise: exercise)
           
                    }
                }
                    Button(action: {
                        
                        var stored =  UserDefaults.standard.object(forKey: "theComplete")as? [String:Date] ?? [String:Date]()
                        
                        let dude = UserDefaults.standard
                        
                        
                        
                        stored[self.workout.title] = Date()
                        print("Completed Size: \(stored.count)")
                        dude.set(stored, forKey: "theComplete")

                    }, label: {
                        Text("Complete Workout").bold().frame(width: 150, height: 50, alignment: .center).background(Color("AppColor")).cornerRadius(15).foregroundColor(Color.black)
                    } )
                }
                .frame(height:350)
                .offset(y: -50)
                VStack{
                    Text("Todays Inspiration")
                    .font(.system(size: 30))
                        .padding()
                    VStack{
                        Text(quote.en)
                    Text("- "+quote.author)
                    
                    }.padding()
                }
           
                Spacer()
          
            }
        }
        .navigationBarTitle(workout.title)
        
    }
}


