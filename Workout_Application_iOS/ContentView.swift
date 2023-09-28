//
//  WorkoutViewModel.swift
//  Palinec_Ivchenko_FinalProj
//
//  Created by Mykhaylo Ivchenko (RIT Student) on 12/9/21.
//  Created by Marko Palinec (RIT Student) on 12/9/21.
//  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = WorkoutViewModel()
    @ObservedObject private var quoteModel = QuotesViewModel()
    @State private var shouldShowSheet = false
    
    
    
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
        TabView{
            
        
        NavigationView{
            WorkoutListView(viewModel: viewModel, quoteModel: quoteModel)
            .navigationBarTitle("Fitness Disco")
            .navigationBarItems(trailing: Button(action: {
                    self.shouldShowSheet = true
                }){
                    Image(systemName:"plus")
            })
        }
        .tabItem{
            Text("Presset workouts")
            }
        .sheet(isPresented: $shouldShowSheet) {
            CustomWorkoutView(viewModel: self.viewModel)
        }
            
            
            NavigationView{
                List{
                    ForEach(customData){ workout in
                        WorkoutRowView(workoutViewModel: self.viewModel,
                                       quoteViewModel: self.quoteModel,
                                       workout: workout)
                    }
                }
                .navigationBarTitle("Custom Workouts")
            }
            .tabItem{
                Image(systemName: "bookmark.circle")
                Text("Custom Workouts")
            }
            
            NavigationView{
                CompletedWorkouts()
            }
            .tabItem{
                Text("completed")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
