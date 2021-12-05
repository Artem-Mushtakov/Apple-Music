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
            spacing: 15) {
                
                Text("Медиатека")
                    .font(.title).bold()
                
                ForEach(0...10, id: \.self) { data in
                        
                    VStack {
                        HStack {
                            
                            Image("upNextRadio")
                                .resizable()
                                .frame(width: 120, height: 120)
                                .scaledToFill()
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Тест")
                                    .font(.system(size: 22))
                                
                                Text("Тест")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                            }
                            
                            Spacer(minLength: 0)
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "ellipsis.circle")
                                    .foregroundColor(.gray)
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

struct SearchResultLibrary_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultLibrary()
    }
}
