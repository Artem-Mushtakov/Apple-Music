//
//  LibraryViewInfo.swift
//  Apple_Music
//
//  Created by Артем on 08.10.2021.
//

import SwiftUI

struct LibraryViewInfo: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("Ищите свою музыку?")
                .font(.system(size: Metric.textFontSizeUpLabel,
                              weight: .bold,
                              design: .default))
            
            Text("Здесь появится купленная вами в iTunes Store музыка.")
                .frame(width: Metric.textWidthDownLabel)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

extension LibraryViewInfo {

    enum Metric {
        static let textFontSizeUpLabel: CGFloat = 24
        static let textWidthDownLabel: CGFloat = 300
    }
}

struct MediaLibraryViewInfo_Previews: PreviewProvider {
    static var previews: some View {
        LibraryViewInfo()
    }
}
