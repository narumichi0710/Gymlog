//
//  ColorSchemeType.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI

public enum ColorSchemeType: Int, CaseIterable {
    case followSystem
    case light
    case dark
    
    public var type: ColorScheme? {
        switch self {
        case .followSystem:
           return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    public var localize: String {
        switch self {
        case .followSystem:
            return "Follow system"
        case .light:
            return "Light mode"
        case .dark:
            return "Dark mode"
        }
    }
}

