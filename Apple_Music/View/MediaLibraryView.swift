//
//  MediaLibraryView.swift
//  Apple_Music
//
//  Created by Артем on 04.10.2021.
//

import SwiftUI

struct MediaLibraryView: View {
    
    @State private var showFilter = true
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView {
                NavigationView {
                    VStack {
                        
                        if showFilter {
                            MediaLibraryViewInfo()
                            MediaLibraryPlayer()
                        } else {
                            MediaLibraryList()
                            MediaLibraryPlayer()
                        }
                    }
                    .navigationBarTitle(Text("Медиатека"))
                    
                    .navigationBarItems(trailing: Button(action: {
                        showFilter.toggle()
                    }, label: {
                        if showFilter {
                            Text("Править").foregroundColor(.red)
                        } else {
                            Text("Готово").foregroundColor(.red)
                        }
                    }))
                    
                }
                
                .tabItem {
                    Image(systemName: "rectangle.stack.badge.play")
                    Text("Медиатека")
                }
                
                NavigationView {
                    Text("Радио")
                        .navigationBarTitle(Text("Радио"))
                }
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Радио")
                }
                
                NavigationView {
                    Text("Поиск")
                        .navigationBarTitle(Text("Поиск"))
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
            }.accentColor(Color.red)
        }
    }
}

struct MediaLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        MediaLibraryView()
    }
}
