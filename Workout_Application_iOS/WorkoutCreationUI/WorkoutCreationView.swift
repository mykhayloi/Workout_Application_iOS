////
////  WorkoutCreationView.swift
////  Palinec_Ivchenko_FinalProj
////
////  Created by Mykhaylo Ivchenko (RIT Student) on 12/9/21.
////  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
////
//
//import SwiftUI
//
//struct WorkoutCreationView: View {
//
//    @ObservedObject var viewModel: WorkoutViewModel
//
//    @Environment(\.presentationMode) private var presentationMode
//    @State private var title: String = ""
//    @State private var content: String = ""
//
//    private var isValid: Bool {
//        return !title.isEmpty && !content.isEmpty
//    }
//
//    var body: some View {
//        NavigationView{
//            Form{
//                Section(header: Text("Info")){
//                    TextField("Enter name of workout", text: $title)
//                    TextField("Enter workout", text: $content)
//                }
//
//                Button(action: {
//                    self.create(title:self.title,
//                                content: self.content)
//                }){
//                    Text("Create Workout")
//                }.environment(\.isEnabled, isValid)
//
//            }
//            .navigationBarTitle("Create Workout")
//            .navigationBarItems(trailing: Button(action: {
//                self.dismiss()
//            }) {
//                Text("Close")
//            })
//
//        }
//    }
//
//    private func create(title: String, content: String) {
//          viewModel.create(title: title, content: content)
//          dismiss()
//      }
//
//    private func dismiss() {
//        presentationMode.wrappedValue.dismiss()
//    }
//}
//
//struct WorkoutCreationView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutCreationView(viewModel: WorkoutViewModel())
//    }
//}
