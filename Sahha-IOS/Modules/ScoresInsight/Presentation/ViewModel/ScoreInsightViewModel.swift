//
//  ScoreInsightViewModel.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation
import Sahha

class ScoreInsightViewModel: ObservableObject {
    
    @Published var score : String = "Waiting..."
    @Published var isError = false
    @Published var errorMessage: String?
    @Published var isAnalyzeButtonEnabled: Bool = true
    
    @MainActor func getAnalysisForToday() {
        
        if Sahha.isAuthenticated == false {
            return
        }
        isAnalyzeButtonEnabled = false
        Sahha.analyze { error, json in
            DispatchQueue.main.async {
                self.isAnalyzeButtonEnabled = true
                if let error = error {
                    self.errorMessage = error
                    self.isError = true
                } else if let json = json {
                    self.score = json
                    print(json)
                }
            }
        }
    }
    
    @MainActor func getAnalysisForThisWeek() {
        if Sahha.profileToken == nil {
            return
        }
        isAnalyzeButtonEnabled = false
        let today = Date()
        let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -7, to: today) ?? Date()
        Sahha.analyze(dates: (startDate: sevenDaysAgo, endDate: today)) { error, json in
            DispatchQueue.main.async {
                self.isAnalyzeButtonEnabled = true
                if let error = error {
                    self.errorMessage = error
                    self.isError = true
                } else if let json = json {
                    self.score = json
                    print(json)
                }
            }
        }
    }
}
