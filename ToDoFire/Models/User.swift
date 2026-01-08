//
//  User.swift
//  ToDoFire
//
//  Created by Николай Замараев on 08.01.2026.
//

import Foundation
import FirebaseAuth

struct AppUser {
    let uid: String
    let email: String
    
    init(user: User) {
        self.email = user.email ?? "Unknown"
        self.uid = user.uid
    }
}
