//
//  WorkoutViewModel.swift
//  Palinec_Ivchenko_FinalProj
//
//  Created by Mykhaylo Ivchenko (RIT Student) on 12/9/21.
//  Created by Marko Palinec (RIT Student) on 12/9/21.
//  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
//

import SwiftUI

struct CustomWorkoutView: View {
    
    
    @ObservedObject var viewModel : WorkoutViewModel
        @Environment(\.presentationMode) private var presentationMode
    
    @State var workoutTitle = ""
    @State var exerciseTitle = ""
    @State var reps = ""

    
    @State var exercises: [Exercise] = []
    
    var theColor: Color {
        if(self.exerciseTitle.isEmpty || self.reps.isEmpty){
            return Color("ClearAppColor")
        }else{
            return Color("AppColor")
        }
        
    }
    
    var otherColor: Color {
        if(self.workoutTitle.isEmpty || self.exercises.isEmpty){
            return Color("ClearAppColor")
        }else{
            return Color("AppColor")
        }
        
    }
    
    var body: some View {
        NavigationView{
                    VStack{
                        Spacer()
                            VStack{
                                TextField("Type in your workout name", text: $workoutTitle).padding()
                            }
                        VStack (spacing: 16){
                            TextField("Name of exercise", text: $exerciseTitle).padding()
                            TextField("Number of reps", text: $reps).padding()
                        }
                            Button(action: {
                               
                                self.exercises.append(Exercise(title: self.exerciseTitle, reps: self.reps))
                                self.exerciseTitle = ""
                                self.reps = ""
                            }, label: {
                                Text("Add exercise")
                                    .bold()
                                    .frame(width: 150, height: 50, alignment: .center)
                                    .background(theColor)
                                    .cornerRadius(15)
                                    .foregroundColor(Color.black)
                            } )
                                .environment(\.isEnabled, !self.exerciseTitle.isEmpty && !self.reps.isEmpty)
                        List{
                            ForEach(exercises){exercise in
                                
                                HStack{
                                    CustomWorkoutRow(title: exercise.title, content: exercise.reps).padding()
                                    Button(action: { self.removeFromWorkoutList(exercise: exercise) }) {
                                        Image(systemName: "minus").foregroundColor(.blue)
                                    }
                                }
                            }
                            
                        }
                        
                        Button(action: {
                            self.addToWorkoutList(workoutTitle: self.workoutTitle, exercises: self.exercises)
                        }, label: {
                            Text("Add Workout").bold().frame(width: 150, height: 50, alignment: .center).background(otherColor).cornerRadius(15).foregroundColor(Color.black)
                        } )
                            .environment(\.isEnabled, !self.workoutTitle.isEmpty && !self.exercises.isEmpty)
                    }.navigationBarTitle("Custom workout")
                }
        
    }
    
    func addToWorkoutList(workoutTitle: String, exercises:[Exercise]) {
        
        //viewModel.create(title: workoutTitle, exercises: exercises)
        let workout = Workout(title: workoutTitle, exercises: exercises)
        print("New workout: \(workout)")
        presentationMode.wrappedValue.dismiss()
        
        var newArr = [Workout]()
        
        do{
            let storedObjItem = UserDefaults.standard.object(forKey: "theWorkouts") as? Data ?? Data()
            let storedItems = try JSONDecoder().decode([Workout].self, from: storedObjItem as! Data)
            print("Retrieved items: \(storedItems)")
            newArr = storedItems
            print("NewArr: \(newArr.count)")
        }catch var err {
            print(err)
        }
        
        newArr.append(workout)
        
        if let encoded = try? JSONEncoder().encode(newArr) {
            print(encoded)
            UserDefaults.standard.set(encoded, forKey: "theWorkouts")
        }
        
    
    }
    
    func removeFromWorkoutList(exercise: Exercise){
        guard let index = exercises.firstIndex(where: { $0.id == exercise.id}) else {
            
            return
        }
        print(index)
        exercises.remove(at: index)
        print(exercises.count)
    }
    
   
}

struct CustomWorkoutRow: View {
    var title: String
    var content: String
    
    var body: some View
    
    {
            HStack{
            
                Image(systemName: "ant")
                Spacer()
                Text(title)
                Spacer()
                Text("")
                Text("\(content) xREPS")
            
        
        }
    }
    
    
}

