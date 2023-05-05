//
//  UserEntity.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import Foundation

public struct UserEntity: Codable {
    // MARK: 必須情報
    public var id: Int
    public var name: String
    public var gender: Gender
    public var birthday: Date
    public var height: Double
    public var weight: Double
    
    // MARK: 任意情報(仮登録を考慮)
    public var email: String?
    public var password: String?

    
    public init(id: Int = 0, name: String = "" , gender: Gender = .male, birthday: Date = .now, height: Double = 170.5, weight: Double = 60.5, email: String? = nil, password: String? = nil) {
        self.id = id
        self.name = name
        self.gender = gender
        self.birthday = birthday
        self.height = height
        self.weight = weight
        self.email = email
        self.password = password
    }
    
    public static let sampleUser = UserEntity(
        id: 1,
        name: "John Doe",
        gender: .male,
        birthday: Date(),
        height: 170,
        weight: 60,
        email: "johndoe@example.com",
        password: "password123"
    )
}

public enum Gender: Int, Codable, CaseIterable {
    case male
    case female
    case other
    
    public var localize: String {
        switch self {
        case .male:
            return "男性"
        case .female:
            return "女性"
        case .other:
            return "その他"
        }
    }
}
