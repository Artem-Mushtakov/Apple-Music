//
//  MediaLibraryView.swift
//  Apple_Music
//
//  Created by Артем on 04.10.2021.
//

import SwiftUI

struct MediaLibraryView: View {
    var body: some View {
        
        let buttonCreate = Button(action: { }) {
            Text("Править").foregroundColor(Color.red)
        }
     
        NavigationView {
            VStack {
                MediaLibraryTabBar()
            }
            
            .navigationBarTitle(Text("Медиатека"))
            .navigationBarItems(trailing: buttonCreate)
        }
    }
}

struct MediaLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        MediaLibraryView()
    }
}
