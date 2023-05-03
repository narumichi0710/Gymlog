//
//  GoalEntity.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI

public struct GoalEntity: Codable {
    public var id: Int
    public var userId: Int
    public var name: String
    public var startDate: Date
    public var endDate: Date
    public var goalType: GoalType
    
    public init(id: Int, userId: Int, name: String, startDate: Date, endDate: Date, goalType: GoalType) {
        self.id = id
        self.userId = userId
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.goalType = goalType
    }
    
    public static let goal1 = GoalEntity(id: 1, userId: 1, name: "体重減量", startDate: Date(), endDate: Date().addingTimeInterval(60*60*24*30), goalType: .weightLoss)

    public static let goal2 = GoalEntity(id: 2, userId: 2, name: "筋力アップ", startDate: Date(), endDate: Date().addingTimeInterval(60*60*24*60), goalType: .muscleGain)

    public static let goal3 = GoalEntity(id: 3, userId: 3, name: "10km走れるようになる", startDate: Date(), endDate: Date().addingTimeInterval(60*60*24*90), goalType: .runningDistance)

    public static let goalList = [goal1, goal2, goal3]
}

public enum GoalType: String, Codable, CaseIterable {
    case weightLoss = "減量"
    case muscleGain = "筋トレ"
    case runningDistance = "ランニング距離"
}
