//
//  LoginRootView.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/04.
//

import SwiftUI
import User

public struct LoginRootView: View {
    @State var isPresentedInput = false
    @State var isPresentedLogin = false
    @State var isPresentedLogout = false
    @Binding var user: UserEntity?
    
    public init(isPresentedLogin: Bool = false, user: Binding<UserEntity?>) {
        self._user = user
        self.isPresentedLogin = isPresentedLogin
    }
    
    public var body: some View {
        VStack {
            NavigationLink {
                RegisterRootView()
            } label: {
                Text("ユーザー情報初回登録")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 50)
            }
            
            Button(action: {
                isPresentedInput.toggle()
            }) {
                Text("ユーザー情報編集")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 50)
            
            Button(action: {
                isPresentedLogin.toggle()
            }) {
                Text("ログイン")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 50)
            
            Button(action: {
                isPresentedLogout.toggle()
            }) {
                Text("ログアウト")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 50)
        }
        .sheet(isPresented: $isPresentedInput) {
            UserInputView(user: user ?? .sampleUser) {
                isPresentedInput.toggle()
                user = $0
            }
        }
    }
}
