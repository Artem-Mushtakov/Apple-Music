//
//  SearchCategoryCell.swift
//  Apple_Music
//
//  Created by Артем on 30.11.2021.
//

import SwiftUI

struct SearchCategoryCell: View {
    @ObservedObject var dataModel = RadioModelStationsData()
    
    var rows  = [GridItem(.flexible())]
    
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            LazyHGrid(rows: rows, spacing: Metric.hGridSpacing) {

                ForEach(dataModel.data, id: \.id) { data in
                    VStack {
                        HStack {
                            
                            Image(data.image)
                                .resizable()
                                .frame(width: Metric.imageFrameWidth,
                                       height: Metric.imageFrameHeight)
                                .scaledToFill()
                                .cornerRadius(Metric.imageCornerRadius)
                        }
                    }
                }
            }
            .padding(.leading, Metric.hGridLeadingPadding)
            .padding(.trailing, Metric.hGridTrailingPadding)
        }
    }
}

extension SearchCategoryCell {

    enum Metric {
        static let imageFrameWidth: CGFloat = 180
        static let imageFrameHeight: CGFloat = 100
        static let imageCornerRadius: CGFloat = 10

        static let hGridSpacing: CGFloat = 10
        static let hGridLeadingPadding: CGFloat = 8
        static let hGridTrailingPadding: CGFloat = 8
    }
}

struct SearchCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategoryCell()
    }
}
