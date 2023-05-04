//
//  File.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/04.
//

import SwiftUI
import ColorScheme
import User
import Record
import Goal
import Body
import Auth

public final class AppData: ObservableObject {
    @Published var user: UserEntity? = nil
    
    public init(){}
}



