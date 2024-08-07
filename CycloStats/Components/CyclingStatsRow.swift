//
//  CyclingStatsRow.swift
//  CycloStats
//
//  Created by KaayZenn on 10/07/2024.
//

import SwiftUI

struct CyclingStatsRow: View {
    
    // Builder
    var icon: String
    var title: String
    var value: String
    var withBackground: Bool? = false
    
    // MARK: -
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                Text(title)
            }
            .font(.system(size: 14, weight: .medium, design: .rounded))
            
            Text(value)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .contentTransition(.numericText())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .if(withBackground ?? false) { view in
            view
                .backgroundComponent()
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    CyclingStatsRow(icon: "person.fill", title: "Preview", value: "12.34 km")
}
