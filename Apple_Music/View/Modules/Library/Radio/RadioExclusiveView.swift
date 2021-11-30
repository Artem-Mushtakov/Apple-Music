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
                            .frame(width: 350, height: 250)
                            .scaledToFill()
                            .cornerRadius(5)
                        
                        Divider()
                    }
                }
            }
        }
        .padding(10)
    }
}

struct RadioExclusiveView_Previews: PreviewProvider {
    static var previews: some View {
        RadioExclusiveView()
    }
}
