//
//  WorkoutViewModel.swift
//  Palinec_Ivchenko_FinalProj
//
//  Created by Mykhaylo Ivchenko (RIT Student) on 12/9/21.
//  Created by Marko Palinec (RIT Student) on 12/9/21.
//  Copyright © 2021 Mykhaylo Ivchenko (RIT Student). All rights reserved.
//

import Foundation
import Combine

final class QuotesViewModel: ObservableObject {
    @Published private(set) var data: Quote?

    private var cancellable: Set<AnyCancellable> = []

    init() {
        getData()
    }

    func getData() {
        guard let url = URL(string: "https://programming-quotes-api.herokuapp.com/quotes/random") else {
            fatalError("Url cannot be created.")
        }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601

        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap({ $0.data })
            .decode(type: Quote.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: {
                    self.data = $0
                  })
            .store(in: &cancellable)
        print("JURRRRr")
        
        
       
    }

    
}
