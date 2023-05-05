//
//  RegisterRootView.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/04.
//

import SwiftUI
import User

public enum RegisterType: Int, CaseIterable {
    case name
    case gender
    case birthday
    case height
    case weight
    case confirm
    
    public var title: String {
        switch self {
        case .name:
            return "まず、ニックネームを入力してください。"
        case .gender:
            return "性別を入力してください。"
        case .birthday:
            return "誕生日を入力してください。"
        case .height:
            return "身長を入力してください。"
        case .weight:
            return "体重を入力してください。"
        case .confirm:
            return "以下の内容で登録します。"
        }
    }
    
    public var discripion: String {
        return self == .confirm ? "" : "入力された情報は厳守されますのでご心配はいりません。"
    }
    
    public var label: String {
        switch self {
        case .name:
            return "ニックネーム"
        case .gender:
            return "性別"
        case .birthday:
            return "誕生日"
        case .height:
            return "身長(cm)"
        case .weight:
            return "体重(kg)"
        case .confirm:
            return ""
        }
    }
    
    
    public func onBack() -> RegisterType {
        guard let applyStep = RegisterType(rawValue: self.rawValue - 1) else {
            return self
        }
        return applyStep
    }
    
    public func onForward() -> RegisterType {
        guard let applyStep = RegisterType(rawValue: self.rawValue + 1) else {
            return self
        }
        return applyStep
    }
}


public struct RegisterRootView: View {
    @Environment(\.dismiss) var dismiss
    @State var currentStep: RegisterType
    @State var user: UserEntity

    public init(currentStep: RegisterType = .name, user: UserEntity = .init()) {
        self._currentStep = .init(initialValue: currentStep)
        self._user = .init(initialValue: user)
    }
    
    public var body: some View {
        VStack {
            TabView(selection: $currentStep) {
                ForEach(RegisterType.allCases, id: \.rawValue) {
                    RegisterStepView(
                        user: $user,
                        step: $0,
                        onBack: {
                            withAnimation {
                                currentStep = currentStep.onBack()
                            }
                        },
                        onForward: {
                            withAnimation {
                                currentStep = currentStep.onForward()
                            }
                        }
                    )
                    .tag($0)
                }
            }
            Spacer()
        
            HStack {
                Button(action: {
                    withAnimation {
                        currentStep = currentStep.onBack()
                    }
                }) {
                    Text("戻る")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                if currentStep == .confirm {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("登録")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                } else {
                    Button(action: {
                        withAnimation {
                            currentStep = currentStep.onForward()
                        }
                    }) {
                        Text("次へ")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(16.0)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .navigationBarTitleDisplayMode(.inline)
    }
}

public struct RegisterStepView: View {
    @Binding var user: UserEntity
    private let step: RegisterType
    private var onBack: () -> Void
    private var onForward: () -> Void
        
    public init(user: Binding<UserEntity>, step: RegisterType, onBack: @escaping () -> Void, onForward: @escaping () -> Void) {
        self._user = user
        self.step = step
        self.onBack = onBack
        self.onForward = onForward
    }
    
    public var body: some View {
        VStack(spacing: 8.0) {
        
            HStack {
                Text(step.title)
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
            }
        
            HStack {
                Text(step.discripion)
                    .font(.subheadline)
                Spacer()
            }
            
            Spacer()
            switch step {
            case .name:
                TextField(step.label, text: $user.name)
                    .textFieldStyle(.roundedBorder)
            case .gender:
                Picker(step.label, selection: $user.gender) {
                    ForEach(Gender.allCases, id: \.rawValue) {
                        Text($0.localize)
                            .padding(40.0)
                            .tag($0)
                    }
                }
                .frame(width: 200, height: 300.0)
                .pickerStyle(.wheel)
                
            case .birthday:
                DatePicker(step.label, selection: $user.birthday, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
            case .height:
                Picker(step.label, selection: $user.height) {
                    ForEach(0..<300) {
                        Text("\($0) cm")
                            .tag($0)
                    }
                }
                .pickerStyle(.wheel)
                
            case .weight:
                HStack(spacing: 0.0) {
                    Picker(step.label, selection: .init(
                        get: { user.weight },
                        set: { user.weight = $0 }
                    )) {
                        ForEach(0..<300) {
                            Text("\($0)")
                                .tag(Double($0) + user.weight.demical)
                        }
                    }
                    .frame(height: 300.0)
                    .pickerStyle(.wheel)
                    Text(".")
                    Picker(step.label, selection: .init(
                        get: { user.weight.demicalToInt },
                        set: { user.weight = Double($0 / 10) + Double(Int(user.weight)) }
                    )) {
                        ForEach(0..<10) {
                            Text("\($0)")
                                .tag($0)
                        }
                    }
                    .frame(height: 300.0)
                    .pickerStyle(.wheel)
                    
                    Text("kg")
                }
            case .confirm:
                
                HStack {
                    Text(RegisterType.name.label)
                    Spacer()
                    Text(user.name)
                }
                .padding()
                HStack {
                    Text(RegisterType.gender.label)
                    Spacer()
                    Text(user.gender.localize)
                }
                .padding()
                HStack {
                    Text(RegisterType.birthday.label)
                    Spacer()
                    Text("\(user.birthday)")
                }
                .padding()
                HStack {
                    Text(RegisterType.height.label)
                    Spacer()
                    Text(String(format: "%.1f", user.height))
                }
                .padding()
                HStack {
                    Text(RegisterType.weight.label)
                    Spacer()
                    Text("\(user.weight)")
                }
                .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

public extension Double {
    
    var int: Int {
        Int(self)
    }
    
    var demical: Double {
        self.truncatingRemainder(dividingBy: 1)
    }
    
    var demicalToInt: Double {
        demical * 10.0
    }
}

public extension Int {
    
    
    // 少数を変更する場合
    func sum(_ int: Int) -> Double {
        Double(int) + Double(int / 10)
    }
    
    // 整数を変更する場合
    func sum(_ demical: Double) -> Double {
        Double(self) + demical
    }
}
