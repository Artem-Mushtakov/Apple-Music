//
//  SearchResultLibrary.swift
//  Apple_Music
//
//  Created by Артем on 30.11.2021.
//

import SwiftUI

struct SearchResultLibrary: View {
    
    @ObservedObject var dataModel = RadioModelStationsData()
    var columns  = [GridItem(.flexible())]
    
    var body: some View {
        
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: Metric.vGridSpacing) {
                
                Text("Медиатека")
                    .font(.title).bold()
                
                ForEach(0...10, id: \.self) { data in
                    
                    VStack {
                        HStack {
                            
                            Image("upNextRadio")
                                .resizable()
                                .frame(width: Metric.imageFrameWidth,
                                       height: Metric.imageFrameHeight)
                                .scaledToFill()
                                .cornerRadius(Metric.imageCornerRadius)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Тест")
                                    .font(.system(size: Metric.textFontSizeUpLabel))
                                
                                Text("Тест")
                                    .foregroundColor(.gray)
                                    .font(.system(size: Metric.textFontSizeDownLabel))
                            }
                            
                            Spacer(minLength: Metric.minLength)
                            
                            Button {} label: {
                                Image(systemName: "ellipsis.circle")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Divider()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, Metric.vGridPaddingBottom)
    }
}

extension SearchResultLibrary {
    
    enum Metric {
        static let imageFrameWidth: CGFloat = 120
        static let imageFrameHeight: CGFloat = 120
        static let imageCornerRadius: CGFloat = 10

        static let vGridSpacing: CGFloat = 15
        static let vGridPaddingBottom: CGFloat = 50

        static let textFontSizeUpLabel: CGFloat = 22
        static let textFontSizeDownLabel: CGFloat = 14

        static let minLength:CGFloat = 0
    }
}

struct SearchResultLibrary_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultLibrary()
    }
}
