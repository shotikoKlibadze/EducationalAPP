//
//  PreferenceKeys.swift
//  EducationalAPP
//
//  Created by Shotiko Klibadze on 10.04.23.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
  
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
}
