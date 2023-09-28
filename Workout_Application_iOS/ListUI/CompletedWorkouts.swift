//
//  CompletedWorkouts.swift
//  Palinec_Ivchenko_FinalProj
//
//  Created by Marko on 15.12.2021..
//  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
//

import SwiftUI

struct CompletedWorkouts: View {
    
     var workouts: [String:Date]{

        return UserDefaults.standard.object(forKey: "theComplete")as? [String:Date] ?? [String:Date]()
        
    }
    

    
    var body: some View {
        List{
            ForEach(workouts.sorted(by: >), id: \.key) { key, value in
                Text("\(key) - finished at - \(value)")
                
            }
        }.navigationBarTitle("Completed Workouts")
    }
    
    func printDic(dict: [String:Date]) -> String{
        var temp = ""
        for(key, value) in workouts{
            temp += "\(key) at \(value)"
        }
        return temp
    }
}

struct CompletedWorkouts_Previews: PreviewProvider {
    static var previews: some View {
        CompletedWorkouts()
    }
}
