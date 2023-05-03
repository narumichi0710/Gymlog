//
//  RecordData.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI

public class RecordData: ObservableObject {
    @Published public var records: [RecordEntity] = []
    
    public static var sampleRecordData = RecordData(records: [.record1, .record2])

    
    public init(records: [RecordEntity]) {
        self.records = records
    }

    public func addRecord(_ record: RecordEntity) {
        records.append(record)
    }
    
    public func getRecords() -> [RecordEntity] {
        return records
    }
    
    public func getRecordsByDate(_ date: Date) -> [RecordEntity] {
        let filteredRecords = records.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
        return filteredRecords
    }
    
    public func getRecordItemsByExerciseId(_ exerciseId: Int) -> [RecordItemEntity] {
        let filteredRecords = records.filter { $0.item.contains(where: { $0.exerciseId == exerciseId }) }
        let recordItems = filteredRecords.flatMap { $0.item }
        let filteredRecordItems = recordItems.filter { $0.exerciseId == exerciseId }
        return filteredRecordItems
    }
    
    public func getRecordItemsByExerciseIdAndDate(_ exerciseId: Int, _ date: Date) -> [RecordItemEntity] {
        let filteredRecords = records.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
        let recordItems = filteredRecords.flatMap { $0.item }
        let filteredRecordItems = recordItems.filter { $0.exerciseId == exerciseId }
        return filteredRecordItems
    }
}
