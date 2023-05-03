//
//  GoalInputView.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI
import User

public struct GoalInputView: View {
    @Environment(\.dismiss) var dismiss

    @State private var goalName = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var goalType = GoalType.weightLoss
    
    public init(goalEntity: GoalEntity = .goal1) {
        self.goalName = goalEntity.name
        self.startDate = goalEntity.startDate
        self.goalType = goalEntity.goalType
    }
    
    public var body: some View {
        VStack {
            Form {
                Section(header: Text("目標名")) {
                    TextField("目標名を入力してください", text: $goalName)
                }
                Section(header: Text("目標期間")) {
                    DatePicker("開始日", selection: $startDate, displayedComponents: [.date])
                    DatePicker("終了日", selection: $endDate, displayedComponents: [.date])
                }
                Section(header: Text("目標種別")) {
                    Picker("目標種別", selection: $goalType) {
                        Text(GoalType.weightLoss.rawValue).tag(GoalType.weightLoss)
                        Text(GoalType.muscleGain.rawValue).tag(GoalType.muscleGain)
                        Text(GoalType.runningDistance.rawValue).tag(GoalType.runningDistance)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            Spacer()
        }
        .navigationBarTitle("目標設定")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("保存", action: {
            dismiss()
        }))
    }
}

