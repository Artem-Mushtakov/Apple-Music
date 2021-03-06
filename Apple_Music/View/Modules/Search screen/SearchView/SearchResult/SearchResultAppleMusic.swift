//
//  SearchResultAppleMusic.swift
//  Apple_Music
//
//  Created by Артем on 30.11.2021.
//

import SwiftUI

struct SearchResultAppleMusic: View {
    
    @ObservedObject var dataModel = RadioModelStationsData()
    @Binding var searchText: String
    var columns  = [GridItem(.flexible())]

    var body: some View {
        
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: Metric.vGridSpacing) {
                
                Text("Недавние поиски")
                    .font(.title).bold()
                
                ForEach(dataModel.data.filter({ "\($0.title)".contains(searchText) || searchText.isEmpty}), id: \.id) { data in
                    
                    VStack {
                        
                        HStack {
                            
                            Image(data.image)
                                .resizable()
                                .frame(width: Metric.imageFrameWidth,
                                       height: Metric.imageFrameHeight)
                                .scaledToFill()
                                .cornerRadius(Metric.imageCornerRadius)
                            
                            VStack(alignment: .leading) {
                                
                                Text(data.title)
                                    .font(.system(size: Metric.textFontSizeUpLabel))
                                
                                Text(data.subtitle)
                                    .foregroundColor(.gray)
                                    .font(.system(size: Metric.textFontSizeDownLabel))
                            }
                            Spacer(minLength: Metric.spacerMinLength)
                            
                            Button {} label: {
                                Image(systemName: "ellipsis.circle")
                                    .foregroundColor(.gray)
                                    .padding()
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

extension SearchResultAppleMusic {
    
    enum Metric {
        static let imageFrameWidth: CGFloat = 120
        static let imageFrameHeight: CGFloat = 120
        static let imageCornerRadius: CGFloat = 10

        static let vGridSpacing: CGFloat = 15
        static let vGridPaddingBottom: CGFloat = 50

        static let textFontSizeUpLabel: CGFloat = 22
        static let textFontSizeDownLabel: CGFloat = 14

        static let spacerMinLength: CGFloat = 0
    }
}

struct SearchResultAppleMusic_Previews: PreviewProvider {
    
    @State static var searchTextPreviews = ""
    
    static var previews: some View {
        SearchResultAppleMusic(searchText: $searchTextPreviews)
    }
}
