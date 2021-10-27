//
//  ContentItem.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/27.
//

import Foundation

class ItemModel: ObservableObject {
    @Published var items: [ContentItem] = [
        ContentItem(id: Date(), content: "sample", isDone: true)
    ]
}

struct ContentItem: Identifiable {
    var id: Date
    var content: String
    var isDone: Bool
}
