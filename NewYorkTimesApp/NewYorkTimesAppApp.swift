//
//  NewYorkTimesAppApp.swift
//  NewYorkTimesApp
//
//  Created by Diego Vazquez Sanchez on 05/12/24.
//

import SwiftUI
import SwiftData

@main
struct NewYorkTimesAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            NewsListView()
        }
        .modelContainer(for: ArticleItem.self)
    }
}
