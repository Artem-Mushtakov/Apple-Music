//
//  SearchResultAppleMusic.swift
//  Apple_Music
//
//  Created by Артем on 30.11.2021.
//

import SwiftUI

@available(iOS 15.0, *)
struct SearchResultAppleMusic: View {
    
    @ObservedObject var dataModel = RadioModelStationsData()
    
    private var columns  = [GridItem(.flexible())]
    @State private var search = ""
    
    
    var body: some View {
        
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: 15) {
                
                Text("Недавние поиски")
                    .font(.title).bold()
                
                ForEach(dataModel.data.filter({ "\($0.title)".contains(search) || search.isEmpty}), id: \.id) { data in
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
                            Spacer(minLength: 0)
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "ellipsis.circle")
                                    .foregroundColor(.gray)
                                    .padding()
                            }

                        }
                    }
                    Divider()
                }
                .searchable(text: $search)
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
    }
    
}

@available(iOS 15.0, *)

struct SearchResultAppleMusic_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultAppleMusic()
    }
}
