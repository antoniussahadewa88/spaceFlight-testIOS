//
//  RecentSearchView.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import SwiftUI
import Combine

struct RecentSearchView: View {
    @EnvironmentObject var vm: RecentSearchViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(vm.searches) { item in
                    VStack(alignment: .leading) {
                        Text(item.query).font(.headline)
                        Text(item.timestamp, style: .time).font(.caption).foregroundColor(.secondary)
                    }
                }
                if vm.searches.isEmpty {
                    Text("No recent search yet").foregroundColor(.secondary)
                }
            }
            .navigationTitle("Recent Search")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Clear") { vm.clear() }
                }
            }
        }
    }
}
