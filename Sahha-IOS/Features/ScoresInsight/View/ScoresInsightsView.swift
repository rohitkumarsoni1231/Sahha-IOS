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
            Text("Scores and Insights")
                .font(.largeTitle)
                .padding()
            
            if let scoresInsights = scoresInsightsViewModel.score  {
                Text("Scores: \(scoresInsights)")
                // Display other insights
            } else {
                Text("Loading...")
            }
        }
        .padding()
        .onAppear(perform: {
            scoresInsightsViewModel.getScore24Hours()
            scoresInsightsViewModel.getScoreBy7Days()
        })
    }
}

struct ScoresInsightsView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresInsightsView()
    }
}
