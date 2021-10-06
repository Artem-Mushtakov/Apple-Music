//
//  MediaLibraryTabBar.swift
//  Apple_Music
//
//  Created by Артем on 05.10.2021.
//

import SwiftUI

struct MediaLibraryTabBar: View {
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView {
                VStack {
                    Spacer()
                    
                    Text("Ищите свою музыку?")
                        .font(.system(size: 24,
                                      weight: .bold,
                                      design: .default))
                    
                    Text("Здесь появится купленная вами в iTunes Store музыка.")
                        .frame(width: 300)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    MediaLibraryPlayer()
                }
                
                .tabItem {
                    Image(systemName: "rectangle.stack.badge.play")
                    Text("Медиатека")
                }
                
                Text("Радио")
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                    }
        
                Text("Поиск")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                    }
            }
        }
    }
}

struct MediaLibraryTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MediaLibraryTabBar()
    }
}
