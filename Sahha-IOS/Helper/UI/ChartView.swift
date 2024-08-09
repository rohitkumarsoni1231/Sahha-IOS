//
//  ChartView.swift
//  Sahha-IOS
//
//  Created by Rohit Kumar on 08/08/2024.
//

import Foundation
import SwiftUI

struct ChartView: View {
    let data: [Double]

    var body: some View {
        GeometryReader { geometry in
            let maxValue = data.max() ?? 1
            let barWidth = geometry.size.width / CGFloat(data.count)
            
            HStack(alignment: .bottom, spacing: 4) {
                ForEach(data.indices, id: \.self) { index in
                    let value = data[index]
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: barWidth, height: CGFloat(value) / CGFloat(maxValue) * geometry.size.height)
                }
            }
        }
    }
}
