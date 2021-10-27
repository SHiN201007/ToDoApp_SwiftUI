//
//  TodoModel.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/27.
//

import Foundation
import Firebase
import Ballcap

class TodoModel {
    func insertTodo(content: String, completion: @escaping() -> Void) {
        let ref = db.collection("ToDoItem")
        let document: Document<ToDo.ToDoItems> = Document(collectionReference: ref)
        document.data?.content = content
        document.save { error in
            if let _error = error {
                print("error:", _error)
            }
            completion()
        }
    }
    
    // MARK: -- GET
    func getToDoItems(completion: @escaping([ContentItem]) -> Void) {
        let ref = db.collection("ToDoItem")
        ref.order(by: "createdAt", descending: true)
            .addSnapshotListener { snapshot, error in
                var items: [ContentItem] = []
                
                guard let documents = snapshot?.documents else { return }
                _ = documents.map {
                    
                    let date = $0["createdAt"] as? Timestamp
                    
                    items.append(
                        ContentItem(
                            id: $0.documentID,
                            content: $0["content"] as! String,
                            isDone: false,
                            createAt: date?.dateValue() ?? Date()
                        )
                    )
                }
                
                completion(items)
            }
    }
    
    // MARK: -- Delete
    func deleteItem(docID: String, completion: @escaping() -> Void) {
        let ref = db.collection("ToDoItem").document(docID)
        ref.delete { error in
            if let _error = error {
                print("error:", _error)
            }
            completion()
        }
    }
}
