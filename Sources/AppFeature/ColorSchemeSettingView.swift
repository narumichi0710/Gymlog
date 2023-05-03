//
//  ColorSchemeSettingView.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI

public enum DarkModeSetting: Int {
    case followSystem = 0
    case darkMode = 1
    case lightMode = 2
}

public struct ColorSchemeSettingView: View {
    @AppStorage(wrappedValue: 0, "appearanceMode") var appearanceMode

    public init() {
    }
    
    public var body: some View {
        Picker("Appearance setting", selection: $appearanceMode) {
            Text("Follow system")
                .tag(0)
            Text("Dark mode")
                .tag(1)
            Text("Light mode")
                .tag(2)
        }
    }
}

public struct ColorSchemeSettingView_Previews: PreviewProvider {
    public static var previews: some View {
        ColorSchemeSettingView()
    }
}
