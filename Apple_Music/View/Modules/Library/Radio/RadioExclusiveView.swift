//
//  RadioExclusiveView.swift
//  Apple_Music
//
//  Created by Артем on 16.10.2021.
//

import SwiftUI

struct RadioExclusiveView: View {
    
    @ObservedObject var dataModel = RadioModelExclusiveData()
    
    var rows  = [GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: rows, spacing: Metric.lazyHGridSpacing) {
                
                ForEach(dataModel.data, id: \.id) { data in
                    
                    VStack(alignment: .leading) {
                        Divider()
                        
                        Text(data.title)
                            .foregroundColor(.gray)
                            .font(.system(size: Metric.textFontSizeTitleLabel))
                        
                        Text(data.subTitle)
                            .font(.system(size: Metric.textFontSizeSubTitleLabel))
                        
                        Text(data.groupTitle)
                            .font(.system(size: Metric.textFontSizeGroupTitleLabel))
                            .foregroundColor(.gray)
                        
                        Image(data.image)
                            .resizable()
                            .frame(width: Metric.imageFrameWidth,
                                   height: Metric.imageFrameHeight)
                            .scaledToFill()
                            .cornerRadius(Metric.imageCornerRadius)
                        
                        Divider()
                    }
                }
            }
        }
        .padding(10)
    }
}

extension RadioExclusiveView {
    
    enum Metric {
        static let imageFrameWidth: CGFloat = 350
        static let imageFrameHeight: CGFloat = 250
        static let imageCornerRadius: CGFloat = 5

        static let lazyHGridSpacing: CGFloat = 10

        static let textFontSizeTitleLabel: CGFloat = 14
        static let textFontSizeSubTitleLabel: CGFloat = 22
        static let textFontSizeGroupTitleLabel: CGFloat = 22
    }
}

struct RadioExclusiveView_Previews: PreviewProvider {
    static var previews: some View {
        RadioExclusiveView()
    }
}
