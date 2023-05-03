//
//  RootView.swift
//  App
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI

public struct RootView: View {
    @AppStorage(wrappedValue: 0, "appearanceMode") var appearanceMode
    
    public init() {}
    public var body: some View {
        NavigationStack {
            List {
                NavigationLink("目標設定機能", destination: Text("TODO:"))
                NavigationLink("種目別記録一覧機能", destination: Text("TODO:"))
                NavigationLink("体重/体脂肪率記録機能", destination: Text("TODO:"))
                NavigationLink("トレーニングプラン機能", destination: Text("TODO:"))
                NavigationLink("SNS機能(message,follow,tag)", destination: Text("TODO:"))
                NavigationLink("タイマー機能", destination: Text("TODO:"))
                NavigationLink("ユーザー情報設定機能", destination: Text("TODO:"))
                NavigationLink("プッシュ通知機能", destination: Text("TODO:"))
                NavigationLink("ダークモード設定機能", destination: ColorSchemeSettingView())
            }
            .navigationTitle("Gymlog")
            .navigationBarTitleDisplayMode(.inline)
        }
        .applyAppearenceSetting(DarkModeSetting(rawValue: self.appearanceMode) ?? .followSystem)
    }
}

extension View {
    @ViewBuilder
    func applyAppearenceSetting(_ setting: DarkModeSetting) -> some View {
        switch setting {
        case .followSystem:
            self
                .preferredColorScheme(.none)
        case .darkMode:
            self
                .preferredColorScheme(.dark)
        case .lightMode:
            self
                .preferredColorScheme(.light)
        }
    }
}


public struct ContentView_Previews: PreviewProvider {
    public static var previews: some View {
        RootView()
    }
}
