//
//  CyclingStatsAverageView.swift
//  CycloStats
//
//  Created by KaayZenn on 10/07/2024.
//

import SwiftUI

struct CyclingStatsAverageView: View {
    
    // EnvironmentObject
    @EnvironmentObject private var healthManager: HealthManager
    
    // MARK: -
    var body: some View {
        VStack(spacing: 12) {
            Text("Statistiques moyennes")
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    CyclingStatsRow(
                        icon: "point.bottomleft.forward.to.point.topright.scurvepath.fill",
                        title: "Distance",
                        value: healthManager.averageDistanceInKm.formatWith(num: 2) + " km"
                    )
                    
                    CyclingStatsRow(
                        icon: "mountain.2.fill",
                        title: "Dénivelé",
                        value: healthManager.averageElevationInM.formatWith(num: 2) + " m"
                    )
                }
            }
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    CyclingStatsAverageView()
}