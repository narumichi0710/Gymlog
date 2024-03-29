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
                ForEach(ColorSchemeType.allCases, id: \.rawValue) { type in
                    Text(type.localize)
                        .tag(type)
                }
            }
            Spacer()
        }
        .navigationTitle("Color Scheme Setting")
        .navigationBarTitleDisplayMode(.inline)

    }
}

public struct ColorSchemeSettingView_Previews: PreviewProvider {
    public static var previews: some View {
        ColorSchemeRootView()
    }
}
