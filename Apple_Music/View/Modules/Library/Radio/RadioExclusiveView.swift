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
            LazyHGrid(rows: rows, spacing: 10) {
                
                ForEach(dataModel.data, id: \.id) { data in
                    
                    VStack(alignment: .leading) {
                        Divider()
                        
                        Text(data.title)
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        Text(data.subTitle)
                            .font(.system(size: 22))
                        
                        Text(data.groupTitle)
                            .font(.system(size: 22))
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
    }
}

struct RadioExclusiveView_Previews: PreviewProvider {
    static var previews: some View {
        RadioExclusiveView()
    }
}
