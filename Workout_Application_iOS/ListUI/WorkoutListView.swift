//
//  WorkoutViewModel.swift
//  Palinec_Ivchenko_FinalProj
//
//  Created by Mykhaylo Ivchenko (RIT Student) on 12/9/21.
//  Created by Marko Palinec (RIT Student) on 12/9/21.
//  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
//
import SwiftUI

struct WorkoutListView: View {
    @ObservedObject var viewModel: WorkoutViewModel
    @ObservedObject var quoteModel: QuotesViewModel
    let defaults = UserDefaults.standard
    
    private var data: [Workout] {
        return viewModel.data
    }
    
    private var customData: [Workout]{
        
        var temp =  [Workout]()
        do{
            let storedObjItem = UserDefaults.standard.object(forKey: "theWorkouts") as? Data ?? Data()
            let storedItems = try JSONDecoder().decode([Workout].self, from: storedObjItem as! Data)
            print("Retrieved items: \(storedItems)")
            temp = storedItems
        }catch let err {
            print(err)
        }
        
        return temp
        
    }
        
    var body: some View {
        

            NavigationView{
                List{
                    ForEach(data){ workout in
                        WorkoutRowView(workoutViewModel: self.viewModel,
                                       quoteViewModel: self.quoteModel,
                                       workout: workout)
                    }
                }
                .navigationBarTitle("Presset Workouts")
            }.tabItem{
                Image(systemName: "rosette")
                Text("Preset Workouts")
            }
            .navigationBarTitle("Preset Workouts")
            
           
        
            }
        }

