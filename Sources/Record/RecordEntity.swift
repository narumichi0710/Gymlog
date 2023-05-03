//
//  RecordEntity.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import Foundation

public struct RecordEntity: Codable, Identifiable {
    public var id: Int
    public var userId: Int
    public var date: Date
    public var item: [RecordItemEntity]
    
    public init(id: Int, userId: Int, date: Date, item: [RecordItemEntity]) {
        self.id = id
        self.userId = userId
        self.date = date
        self.item = item
    }
    
    public static let item1 = RecordItemEntity(id: 1, userId: 1, exerciseId: 1, date: Date(), weight: 60.0, reps: 10, sets: 3)
    public static let item2 = RecordItemEntity(id: 2, userId: 1, exerciseId: 2, date: Date(), weight: 40.0, reps: 15, sets: 3)
    public static let item3 = RecordItemEntity(id: 3, userId: 1, exerciseId: 3, date: Date(), weight: 80.0, reps: 8, sets: 4)

    public static let record1 = RecordEntity(id: 1, userId: 1, date: Date(), item: [RecordEntity.item1, RecordEntity.item2])
    public static let record2 = RecordEntity(id: 2, userId: 1, date: Date(timeIntervalSinceNow: -86400), item: [RecordEntity.item3])

}

public struct RecordItemEntity: Codable, Identifiable {
    public var id: Int
    public var userId: Int
    public var exerciseId: Int
    public var date: Date
    public var weight: Double
    public var reps: Int
    public var sets: Int
    
    public init(id: Int, userId: Int, exerciseId: Int, date: Date, weight: Double, reps: Int, sets: Int) {
        self.id = id
        self.userId = userId
        self.exerciseId = exerciseId
        self.date = date
        self.weight = weight
        self.reps = reps
        self.sets = sets
    }
}

