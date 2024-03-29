//
//  RootView.swift
//  App
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI
import ColorScheme
import User
import Record
import Goal
import Body
import Auth
import Tutorial

public struct RootView: View {
    @AppStorage(wrappedValue: ColorSchemeType.followSystem, "appearanceMode") var appearanceMode
    @StateObject var appData = AppData()

    public init() {}
    public var body: some View {
        NavigationStack {
            List {
                Group {
                    NavigationLink("ユーザー情報登録機能", destination: LoginRootView(user: $appData.user))
                    NavigationLink("チュートリアル機能", destination: TutorialRootView())
                    NavigationLink("目標設定機能", destination: GoalInputView())
                    NavigationLink("種目別記録一覧機能", destination: RecordRootView())
                    NavigationLink("体重/体脂肪率記録機能", destination: BodyInputView())
                }
                Group {
                    NavigationLink("トレーニングプラン機能", destination: Text("TODO:"))
                    NavigationLink("SNS機能(message,follow,tag)", destination: Text("TODO:"))
                    NavigationLink("タイマー機能", destination: Text("TODO:"))
                    NavigationLink("ユーザー情報設定機能", destination: Text("TODO:"))
                    NavigationLink("プッシュ通知機能", destination: Text("TODO:"))
                    NavigationLink("ダークモード設定機能", destination: ColorSchemeRootView())
                }
            }
            .navigationTitle("Gymlog")
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(appearanceMode.type)
    }
}




public struct ContentView_Previews: PreviewProvider {
    public static var previews: some View {
        RootView()
    }
}
