//
//  AccountView.swift
//  EducationalAPP
//
//  Created by Shotiko Klibadze on 31.03.23.
//

import SwiftUI

struct AccountView: View {
    
    @State var isDeleted = false
    @State var isPinned = false
    
    var body: some View {
        NavigationView {
            List {
                
                profile
                
                menu
                
                links
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text("Meng To")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                Text("Canada")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: HomeView()) {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink { Text("Billing") } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { HomeView() } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .tint(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://www.apple.com")!) {
                    HStack {
                        Label("Website", systemImage: "house.fill")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                //MARK: - SWIPE ACTIONS -
                .swipeActions(edge: .trailing , allowsFullSwipe: false) {
                    Button { isDeleted = true } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    
                 pinButton
                    
                }
            }
            Link(destination: URL(string: "https://www.youtube.com")!) {
                HStack {
                    Label("Website", systemImage: "tv.fill")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            . swipeActions {
                pinButton
            }
        }
        .tint(.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton: some View {
        Button { isPinned.toggle() } label: {
            Label("Pin", systemImage: !isPinned ? "pin" : "pin.slash")
        }
        .tint(!isPinned ? .yellow : .gray)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
