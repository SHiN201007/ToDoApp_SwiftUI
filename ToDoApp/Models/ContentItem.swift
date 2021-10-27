//
//  ContentItem.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/27.
//

import Foundation

class ItemModel: ObservableObject {
    @Published var items: [ContentItem] = []
    
    func load() {
        let model = TodoModel()
        model.getToDoItems { items in
            print("items:", items)
            self.items = items
        }
    }
}

struct ContentItem: Identifiable {
    var id: String
    var content: String
    var isDone: Bool
    var createAt: Date
}
