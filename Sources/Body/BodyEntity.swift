//
//  File.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import Foundation

public struct BodyEntity {
    public var height: Double
    public var weight: Double
    public var bodyFatPer: Double
    public var date: Date
    
    public init(height: Double, weight: Double, bodyFatPer: Double, date: Date) {
        self.height = height
        self.weight = weight
        self.bodyFatPer = bodyFatPer
        self.date = date
    }
    
    public static var sample = BodyEntity(height: 175, weight: 72.8, bodyFatPer: 26.9, date: Date())

}
