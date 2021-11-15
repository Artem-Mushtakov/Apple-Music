//
//  LibraryView.swift
//  Apple_Music
//
//  Created by Артем on 04.10.2021.
//

import SwiftUI

struct LibraryView: View {
    
    @State private var showFilter = true
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            NavigationView {
                VStack {
                    if showFilter {
                        LibraryViewInfo()
                    } else {
                        LibraryViewList()
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
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
