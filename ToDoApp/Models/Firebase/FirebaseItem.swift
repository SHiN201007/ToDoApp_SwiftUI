//
//  FirebaseItem.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/27.
//

import Foundation
import Firebase
import Ballcap

let db = Firestore.firestore()

class ToDo: Object {
    var data: ToDoItems?
    
    // model
    struct ToDoItems: Modelable & Codable {
        var content: String?
        var createdAt: Timestamp?
        var updatedAt: Timestamp?
    }
}
