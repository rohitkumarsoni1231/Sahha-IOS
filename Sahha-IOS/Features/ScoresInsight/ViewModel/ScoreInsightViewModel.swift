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
    
    func getScore24Hours() {
        Sahha.analyze { error, json in
            if let error = error {
                print(error)
            } else if let json = json {
                DispatchQueue.main.async {
                    self.score = json
                }
                print("JSON for 24 Hours: \(json)")
            }
        }
    }
    
    func getScoreBy7Days() {
        let today = Date()
        let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -7, to: today) ?? Date()
        Sahha.analyze(dates: (startDate: sevenDaysAgo, endDate: today)) { error, json in
            if let error = error {
                print(error)
            } else if let json = json {
                DispatchQueue.main.async {
                    self.score = json
                }
               
                print("JSON for 7 Days: \(json)")
            }
        }
    }
}
