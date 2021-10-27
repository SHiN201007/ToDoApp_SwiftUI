//
//  ContentView.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ToDoListView()
            .environmentObject(ItemModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ItemModel())
    }
}
