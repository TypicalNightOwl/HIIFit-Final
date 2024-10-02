//
//  HIIFitApp.swift
//  HIIFit
//
//  Created by Ryan Westhoelter on 9/11/24.
//

import SwiftUI

@main
struct HIIFitApp: App {
    @StateObject private var historyStore = HistoryStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print(URL.documentsDirectory)
                }
                .buttonStyle(.raised)
                .environmentObject(historyStore)
                .alert(isPresented: $historyStore.loadingError) {
                Alert(
                    title: Text("History"),
                    message: Text(
                    """
                    Unfortunately we can't load your past history.
                    Email support:
                    support@xyz.com
                    """))
                }
        }
    }
}
