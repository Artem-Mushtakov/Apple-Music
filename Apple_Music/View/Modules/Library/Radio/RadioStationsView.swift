//
//  RadioStationsView.swift
//  Apple_Music
//
//  Created by Артем on 16.10.2021.
//

import SwiftUI

struct RadioStationsView: View {
    
    @ObservedObject var dataModel = RadioModelStationsData()
    var columns  = [GridItem(.flexible())]
    
    var body: some View {
        
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: 15) {
                
                Text("Станции")
                    .font(.title).bold()
                
                ForEach(dataModel.data, id: \.id) { data in
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
                                    .font(.system(size: 22))
                                
                                Text(data.subtitle)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                            }
                        }
                    }
                    Divider()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
    }
}

extension RadioStationsView {

    enum Metric {
        static let imageFrameWidth: CGFloat = 120
        static let imageFrameHeight: CGFloat = 120
        static let imageCornerRadius: CGFloat = 10
    }
}

struct RadioStationsView_Previews: PreviewProvider {
    static var previews: some View {
        RadioStationsView()
    }
}
