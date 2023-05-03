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
                Section(header: Text("ニックネーム")) {
                    TextField("", text: $name)
                }
                Section(header: Text("メールアドレス")) {
                    TextField("", text: $email)
                        .keyboardType(.emailAddress)
                }
                Section(header: Text("パスワード")) {
                    SecureField("", text: $password)
                }
                Section(header: Text("誕生日")) {
                    DatePicker("", selection: $birthday, displayedComponents: .date)
                }
                Section(header: Text("性別")) {
                    Picker("", selection: $gender) {
                        ForEach(Gender.allCases, id: \.rawValue) { type in
                            Text(type.localize)
                                .tag(type)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("User Info")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("保存", action: {
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
