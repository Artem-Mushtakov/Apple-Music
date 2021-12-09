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
        
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: rows, spacing: 10) {
                
                ForEach(dataModel.data, id: \.id) { data in
                    VStack {
                        HStack {
                            
                            Image(data.image)
                                .resizable()
                                .frame(width: 180, height: 180)
                                .scaledToFill()
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding(.leading, 8)
            .padding(.trailing, 8)
        }
    }
    
    struct SearchCategoryCell_Previews: PreviewProvider {
        static var previews: some View {
            SearchCategoryCell()
        }
    }
}
