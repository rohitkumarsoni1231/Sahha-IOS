//
//  ScoreInsightViewModel.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation
import Sahha

class ScoreInsightViewModel: ObservableObject {
    
    @Published var score : String?
    @Published var isError = false
    @Published var errorMessage: String?
    
    func getScore24Hours() {
        Sahha.analyze { error, json in
            if let error = error {
                self.errorMessage = error
                self.isError = true
            } else if let json = json {
                DispatchQueue.main.async {
                    self.score = json
                    print(json)
                }
            }
        }
    }
    
    func getScoreBy7Days() {
        let today = Date()
        let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -7, to: today) ?? Date()
        Sahha.analyze(dates: (startDate: sevenDaysAgo, endDate: today)) { error, json in
            if let error = error {
                self.errorMessage = error
                self.isError = true
            } else if let json = json {
                DispatchQueue.main.async {
                    self.score = json
                    print(json)
                }
            }
        }
    }
}
