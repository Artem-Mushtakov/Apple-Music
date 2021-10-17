//
//  RadioStationsView.swift
//  Apple_Music
//
//  Created by Артем on 16.10.2021.
//

import SwiftUI

struct RadioStationsView: View {
    
    @State private var dataModel = RadioModelStations.data
    
    var columns  = [GridItem(.flexible())]
    
    var body: some View {
        
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: 15) {
                
                Text("Станции")
                    .font(.title).bold()
                
                ForEach(dataModel, id: \.id) { data in
                    VStack {
                        HStack {
                            
                            Image(data.image)
                                .resizable()
                                .frame(width: 120, height: 120)
                                .scaledToFill()
                                .cornerRadius(10)
                            
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

struct RadioStationsView_Previews: PreviewProvider {
    static var previews: some View {
        RadioStationsView()
    }
}
