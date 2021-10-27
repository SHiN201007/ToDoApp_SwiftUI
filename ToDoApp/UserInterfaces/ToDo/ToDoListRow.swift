//
//  ToDoListRow.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/20.
//

import SwiftUI

struct ToDoListRow: View {
    @EnvironmentObject var model: ItemModel
    var item: ContentItem
    
    var itemIndex: Int {
        model.items.firstIndex(where: { $0.id == item.id })!
    }
    
    var body: some View {
        HStack {
            SelectButton(isSet: $model.items[itemIndex].isDone)
            Text(item.content)
            Spacer()
        }
        .padding()
    }
}

struct ToDoListRow_Previews: PreviewProvider {
    static var model = ItemModel()
    
    static var previews: some View {
        ToDoListRow(
            item: model.items[0]
        )
        .environmentObject(model)
        .previewLayout(.fixed(width: 300, height: 50))
    }
}
