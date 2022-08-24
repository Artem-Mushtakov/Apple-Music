//
//  SearchCategory.swift
//  Apple_Music
//
//  Created by Артем on 30.11.2021.
//

import SwiftUI

struct SearchCategoryBanner: View {
    
    @ObservedObject var dataModel = RadioModelExclusiveData()
    
    var rows  = [GridItem(.flexible())]
    
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            LazyHGrid(rows: rows, spacing: Metric.vGridSpacing) {

                ForEach(dataModel.data, id: \.id) { data in
                    
                    VStack(alignment: .leading) {
                        Divider()
                        
                        Text(data.title)
                            .foregroundColor(.gray)
                            .font(.system(size: Metric.textFontSizeHeaderLabel))

                        Text(data.subTitle)
                            .font(.system(size: Metric.textFontSizeLabel))

                        Text(data.groupTitle)
                            .font(.system(size: Metric.textFontSizeLabel))
                            .foregroundColor(.gray)
                        
                        Image(data.image)
                            .resizable()
                            .frame(width: Metric.imageFrameWidth, height: Metric.imageFrameHeight)
                            .scaledToFill()
                            .cornerRadius(Metric.imageCornerRadius)

                        Divider()
                    }
                }
            }
        }
        .padding(Metric.vGridPadding)
    }
}

extension SearchCategoryBanner {

    enum Metric {
        static let imageFrameWidth: CGFloat = 350
        static let imageFrameHeight: CGFloat = 250
        static let imageCornerRadius: CGFloat = 5

        static let vGridSpacing: CGFloat = 10
        static let vGridPadding: CGFloat = 10

        static let textFontSizeHeaderLabel: CGFloat = 14
        static let textFontSizeLabel: CGFloat = 22
    }
}

struct SearchCategory_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategoryBanner()
    }
}
