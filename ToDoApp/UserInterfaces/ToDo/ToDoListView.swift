//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/20.
//

import SwiftUI
import KRProgressHUD

struct ToDoListView: View {
    @EnvironmentObject var model: ItemModel
    @State private var content = ""
    @State private var showNotDoneOnly = false
    
    var items: [ContentItem] {
        let items = model.items.sorted { $0.createAt > $1.createAt }
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
                            let todoModel = TodoModel()
                            KRProgressHUD.show()
                            todoModel.insertTodo(content: content) {
                                // succsess
                                KRProgressHUD.dismiss()
                            }
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
            .onAppear(perform: {
                model.load()
            })
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
