//
//  SwiftUIView.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI

public struct BodyInputView: View {
    @Environment(\.dismiss) var dismiss
    @State var height: Double
    @State var weight: Double
    @State var bodyFatPer: Double
    @State var date = Date()
        
    public init(body: BodyEntity = .sample) {
        _height = .init(initialValue: body.height)
        _weight = .init(initialValue: body.weight)
        _bodyFatPer = .init(initialValue: body.bodyFatPer)
        _date = .init(initialValue: body.date)
    }

    public var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("身長（cm）")) {
                    TextField("", value: $height, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("体重（kg）")) {
                    TextField("", value: $weight, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("体脂肪率（%）")) {
                    TextField("", value: $bodyFatPer, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("日付")) {
                    DatePicker("", selection: $date, displayedComponents: .date)
                }
            }
            .navigationBarTitle("体重・体脂肪率の記録")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("保存", action: {
                let body = BodyEntity(height: height, weight: weight, bodyFatPer: bodyFatPer, date: date)
                dismiss()
            }))
        }
    }
}
