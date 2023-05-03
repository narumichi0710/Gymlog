//
//  UserInputView.swift
//  
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI

public struct UserInputView: View {
    @Environment(\.dismiss) var dismiss
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var birthday = Date()
    @State var gender = Gender.male
        
    public init(user: UserEntity = .sampleUser) {
        self.name = user.name
        self.email = user.email
        self.password = user.password
        self.birthday = user.birthday
        self.gender = user.gender
    }

    public var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Name")) {
                    TextField("Enter your name", text: $name)
                }
                Section(header: Text("Email")) {
                    TextField("Enter your email", text: $email)
                        .keyboardType(.emailAddress)
                }
                Section(header: Text("Password")) {
                    SecureField("Enter your password", text: $password)
                }
                Section(header: Text("Birthday")) {
                    DatePicker("Enter your birthday", selection: $birthday, displayedComponents: .date)
                }
                Section(header: Text("Gender")) {
                    Picker("Select your gender", selection: $gender) {
                        Text("Male").tag(Gender.male)
                        Text("Female").tag(Gender.female)
                        Text("Other").tag(Gender.other)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("User Info")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Save", action: {
                let user = UserEntity(id: 0, name: name, email: email, password: password, birthday: birthday, gender: gender)
                dismiss()
            }))
        }
    }
}

public struct UserInputView_Previews: PreviewProvider {
    public static var previews: some View {
        UserInputView(user: UserEntity.sampleUser)
    }
}
