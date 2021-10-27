//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/20.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var model: ItemModel
    @State private var content = ""
    @State private var showNotDoneOnly = false
    
    var items: [ContentItem] {
        let items = model.items.sorted { $0.id > $1.id }
        return items.filter { item in
            (!showNotDoneOnly || !item.isDone)
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                HStack {
                    TextField("今日やることは？", text: $content)
                        .frame(height: 70)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("追加") {
                        if !content.isEmpty {
                            model.items.append(
                                ContentItem(
                                    id: Date(), content: content, isDone: false)
                            )
                            content = ""
                        }
                    }
                    .foregroundColor(.blue)
                    .padding()
                }
                .padding()
                
                Toggle(isOn: $showNotDoneOnly) {
                    Text("未達成のみ表示")
                }
                
                ForEach(items) { item in
                    ToDoListRow(item: item)
                }
            }
            .navigationTitle("TODO")
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var model = ItemModel()
    
    static var previews: some View {
        ToDoListView()
            .environmentObject(model)
    }
}
