//
//  Styles.swift
//  EducationalAPP
//
//  Created by Shotiko Klibadze on 29.03.23.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    
    var cornerRadius = 30.0
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                            .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                        ], startPoint: .top, endPoint: .bottom
                    )
                )
                .blendMode(.overlay)
        )
    }
    
}

extension View {
    
    func strokeStyle(cornerRadius: Double) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
