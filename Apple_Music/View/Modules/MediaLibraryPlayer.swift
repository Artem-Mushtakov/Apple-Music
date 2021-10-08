//
//  MediaLibraryPlayer.swift
//  Apple_Music
//
//  Created by Артем on 05.10.2021.
//

import SwiftUI

struct MediaLibraryPlayer: View {
    var body: some View {
        
        HStack {
            Button(action: { }) {
                Image("michaelkrugPlayer")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .topTrailing)
                    .scaledToFit()
                    .cornerRadius(10)
                    .offset(x: 20, y: 0)
                Text("Михаил Круг Золотые Купола")
                    .offset(x: 20, y: 0)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "play.fill")
                    .frame(alignment: .topLeading)
                    .offset(x: -15, y: 0)
                    .foregroundColor(.black)
            }
            
            Button(action: {}) {
                Image(systemName: "forward.fill")
                    .frame(alignment: .leading)
                    .offset(x: -10, y: 0)
                    .foregroundColor(.black)
            }
            
        }.frame(width: 390, height: 80)
    }
}

struct MediaLibraryPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MediaLibraryPlayer()
    }
}
