//
//  UserEntity.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import Foundation

public struct UserEntity: Codable {
    public var id: Int
    public var name: String
    public var email: String
    public var password: String
    public var birthday: Date
    public var gender: Gender
    
    public init(id: Int, name: String, email: String, password: String, birthday: Date, gender: Gender) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.birthday = birthday
        self.gender = gender
    }
    
    public static let sampleUser = UserEntity(
        id: 1,
        name: "John Doe",
        email: "johndoe@example.com",
        password: "password123",
        birthday: Date(),
        gender: .male
    )
}

public enum Gender: Int, Codable {
    case male
    case female
    case other
}
