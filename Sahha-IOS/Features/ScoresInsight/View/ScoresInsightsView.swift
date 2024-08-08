//
//  ScoresInsightsView.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import SwiftUI
import Sahha

struct ScoresInsightsView: View {
    @ObservedObject var scoresInsightsViewModel = ScoreInsightViewModel()
    
    var body: some View {
        VStack {
            
            VStack(spacing: 16) {
                
                Text("\(String(describing: scoresInsightsViewModel.score))")
                
                ChartView(data: [100, 20, 30, 40, 150, 60, 70])
                    .frame(height: 200)
            }
            .padding()
//            Text("Scores and Insights")
//                .font(.largeTitle)
//                .padding()
//            
//            if let scoresInsights = scoresInsightsViewModel.score {
//                VStack(spacing: 16) {
//                    Text("Score (Last 24 Hours): \(scoresInsights)")
//                    ChartView(data: [10, 20])
//                        .frame(height: 200)
//                }
//                .padding()
//            } else {
//                Text("Loading...")
//            }
        }
        .padding()
        .onAppear(perform: {
            if Sahha.profileToken != nil {
                scoresInsightsViewModel.getScore24Hours()
                scoresInsightsViewModel.getScoreBy7Days()
            }
        })
        .alert(isPresented: $scoresInsightsViewModel.isError) {
            Alert(
                title: Text("Authentication Error"),
                message: Text(scoresInsightsViewModel.errorMessage ?? "An error occurred during authentication. Please try again."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    ScoresInsightsView()
}
