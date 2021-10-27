//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by 松丸真 on 2021/10/20.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ItemModel())
        }
    }
}
