//
//  TutorialRootView.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/04.
//

import SwiftUI

public struct TutorialRootView: View {
    @State var currentStep: TutorialType = .begin
    
    public init() {}
    public var body: some View {
        VStack {
            TabView(selection: $currentStep) {
                ForEach(TutorialType.allCases, id: \.rawValue) {
                    TutorialStepView(step: $0) {
                        withAnimation {
                            currentStep = currentStep.onForward()
                        }
                    }
                    .tag($0)
                }
            }
            Spacer()
        
            HStack {
                Text("すでにアカウントをお持ちですか？")
                Button(action: {
                }) {
                    Text("ログイン")
                }
            }
            .padding(16.0)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .navigationBarTitleDisplayMode(.inline)
    }
}

public struct TutorialStepView: View {
    private let step: TutorialType
    private var onForward: () -> Void

    public init(step: TutorialType, onForward: @escaping () -> Void) {
        self.step = step
        self.onForward = onForward
    }
    
    public var body: some View {
        VStack(spacing: 30) {
        
            Text(step.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(step.discripion)
                .font(.subheadline)
                .multilineTextAlignment(.center)
            
            Image(systemName: step.mainIconName)
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
                .cornerRadius(10)
                .padding(.bottom, 16)

            Button(action: {
                onForward()
            }) {
                Image(systemName: step.subIconName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                    .cornerRadius(10)
            }
            
            Spacer()
            
        }
        .padding()
    }
}
