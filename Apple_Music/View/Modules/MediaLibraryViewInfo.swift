//
//  MediaLibraryViewInfo.swift
//  Apple_Music
//
//  Created by Артем on 08.10.2021.
//

import SwiftUI

struct MediaLibraryViewInfo: View {
    var body: some View {
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
        }
    }
}

struct MediaLibraryViewInfo_Previews: PreviewProvider {
    static var previews: some View {
        MediaLibraryViewInfo()
    }
}
