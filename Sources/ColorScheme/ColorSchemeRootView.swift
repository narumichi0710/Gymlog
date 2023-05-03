//
//  ColorSchemeRootView.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI

public struct ColorSchemeRootView: View {
    @AppStorage(wrappedValue: ColorSchemeType.followSystem, "appearanceMode") var appearanceMode

    public init() {}
    
    public var body: some View {
        VStack {
            Picker("Appearance setting", selection: $appearanceMode) {
                Text("Follow system")
                    .tag(ColorSchemeType.followSystem)
                Text("Light mode")
                    .tag(ColorSchemeType.light)
                Text("Dark mode")
                    .tag(ColorSchemeType.dark)
            }
            Spacer()
        }
    }
}

public struct ColorSchemeSettingView_Previews: PreviewProvider {
    public static var previews: some View {
        ColorSchemeRootView()
    }
}
