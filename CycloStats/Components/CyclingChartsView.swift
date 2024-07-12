//
//  CyclingChartsView.swift
//  CycloStats
//
//  Created by KaayZenn on 09/07/2024.
//

import SwiftUI
import Charts

struct CyclingChartsView: View {
    
    @EnvironmentObject private var healthManager: HealthManager
    
    var minYAxisValue: Double {
        healthManager.activitiesForCharts.map { $0.distanceInKm }.min() ?? 0
    }
    
    var maxYAxisValue: Double {
        healthManager.activitiesForCharts.map { $0.distanceInKm }.max() ?? 0
    }
    
    // MARK: -
    var body: some View {
        VStack(spacing: 12) {
            Text("Graphique")
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
            Chart {
                ForEach(healthManager.activitiesForCharts, id: \.self) { activity in
                    LineMark(
                        x: .value("X", activity.date),
                        y: .value("Y", activity.distanceInKm)
                    )
                    .lineStyle(StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(Color.green)
                    
                    RuleMark(y: .value("Average Distance", healthManager.averageDistancePerDay))
                        .lineStyle(StrokeStyle(lineWidth: 2, dash: [5, 5]))
                        .foregroundStyle(Color.white)
                        .annotation(position: .top, alignment: .leading) {
                            Text("moy: \(healthManager.averageDistancePerDay.formatWith(num: 2)) km")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                }
            }
            .frame(height: 200)
            .chartYScale(domain: (minYAxisValue - 5)...(maxYAxisValue + 5))
            .chartYAxis {
                AxisMarks(position: .leading, values: .automatic(desiredCount: 5)) {
                    let value = $0.as(Int.self)!
                    AxisValueLabel(horizontalSpacing: 8) {
                        Text(value.formatted())
                    }
                    AxisGridLine()
                }
            }
            .backgroundComponent()
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    CyclingChartsView()
}
