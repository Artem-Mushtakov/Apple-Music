//
//  TabBar.swift
//  Apple_Music
//
//  Created by Артем on 12.10.2021.
//

import SwiftUI

struct TabBar: View {
    
    @State private var searchText = ""
    
    @State var expand = false
    
    @Namespace var animation
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)) {

            TabView {
                LibraryView()
                    .tabItem {
                        Image(systemName: "rectangle.stack.badge.play")
                        Text("Медиатека")
                    }
                RadioView()
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                    }
                
                SearchView()
                    .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Поиск")
                    }
            }
            .accentColor(Color.red)
            
            PlayerView(expand: $expand, animation: animation)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
