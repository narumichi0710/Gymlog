//
//  RecordRootView.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI

public struct RecordRootView: View {
   @StateObject private var recordData: RecordData
   @State private var selectedDate = Date()

    public init(recordData: RecordData = .sampleRecordData, selectedDate: Date = Date()) {
        _recordData = .init(wrappedValue: recordData)
        self.selectedDate = selectedDate
    }
    
    
    public var body: some View {
       VStack {
           HStack {
               Button(action: {
                   selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? .init()
               }) {
                   Image(systemName: "chevron.left")
               }
               Spacer()
               Text(dateString(date: selectedDate))
               Spacer()
               Button(action: {
                   selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? .init()
               }) {
                   Image(systemName: "chevron.right")
               }
           }
           .padding()
           List {
               ForEach(recordData.getRecordsByDate(selectedDate)) { record in
                   Section(header: Text(exerciseName(exerciseId: record.item[0].exerciseId))) {
                       ForEach(record.item) { item in
                           HStack {
                               Text("Weight: \(item.weight) kg")
                               Spacer()
                               Text("Reps: \(item.reps)")
                               Spacer()
                               Text("Sets: \(item.sets)")
                           }
                       }
                   }
               }
           }
       }
       .navigationBarTitle(Text("種目別記録一覧"))
       .navigationBarTitleDisplayMode(.inline)
   }

   private func exerciseName(exerciseId: Int) -> String {
       switch exerciseId {
       case 1:
           return "Bench Press"
       case 2:
           return "Squat"
       case 3:
           return "Deadlift"
       default:
           return ""
       }
   }

   private func dateString(date: Date) -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy/MM/dd"
       return dateFormatter.string(from: date)
   }
}
