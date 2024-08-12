//
//  ScoresInsightsView.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import SwiftUI
import Sahha

struct ScoresInsightsView: View {
    @ObservedObject var viewModel = ScoreInsightViewModel()
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "brain.head.profile")
                    Text("Analyzation")
                    Spacer()
                }.font(.title)
            }
            
            if viewModel.isAnalyzeButtonEnabled {
                Section {
                    Button {
                        viewModel.getAnalysisForToday()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Analyze Previous 24 Hours")
                            Spacer()
                        }
                    }
                }
                Section {
                    Button {
                        viewModel.getAnalysisForThisWeek()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Analyze Previous Week")
                            Spacer()
                        }
                    }
                }
            }
            
            // Only update this section when `viewModel.score` changes
            if viewModel.score.isEmpty == false {
                Section {
                    ScrollView(.horizontal) {
                        Text(viewModel.score).font(.caption)
                    }
                } header: {
                    HStack {
                        Spacer()
                        Text("Analysis")
                        Spacer()
                    }
                }
            }
        }
        .alert(isPresented: $viewModel.isError) {
            Alert(
                title: Text("Authentication Error"),
                message: Text(viewModel.errorMessage ?? "An error occurred during authentication. Please try again."),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear() {
            viewModel.getAnalysisForToday()
        }
    }
}

#Preview {
    ScoresInsightsView()
}
