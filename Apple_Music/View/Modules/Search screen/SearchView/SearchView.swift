//
//  Search.swift
//  Apple_Music
//
//  Created by Артем on 04.12.2021.
//

import SwiftUI

@available(iOS 15.0, *)

struct SearchView: View {
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    @State private var dataModel = RadioModelStations.data
    @State private var search = ""
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(spacing: 18) {
                    
                    if search.isEmpty {
                        
                        Text("Поиск по категориям")
                            .foregroundColor(.black)
                            .font(.title2).bold()
                            .frame(width: 370, height: 20, alignment: .leading)
                            .padding(.bottom, 5)
                            .padding(.top, -5)
                        
                        LazyVGrid(columns: columns) {
                            
                            ForEach(dataModel, id: \.id)  { data in
                                
                                ZStack {
                                    
                                    NavigationLink(destination: SearchCategoryView()) {
                                        
                                        Image(data.image)
                                            .resizable()
                                            .frame(width: 180,
                                                   height: 140,
                                                   alignment: .leading)
                                            .scaledToFill()
                                            .cornerRadius(10)
                                    }
                                    
                                    Text(data.title)
                                        .bold()
                                        .frame(width: 170,
                                               height: 120,
                                               alignment: .bottomLeading)
                                        .foregroundColor(.white)
                                        .font(.system(size: 19))
                                        .scaledToFill()
                                        .padding(.leading, 10)
                                        .padding(.bottom, 10)
                                }
                            }
                        }
                        .padding(.top, 10)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        
                    } else {
                        SearchResultView(searchText: $search)
                    }
                    
                }
                .padding()
                .padding(.bottom, 80)
            }
            .navigationBarTitle(Text("Поиск"))
            .searchable(text: $search,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Ваша медиатека")
        }
    }
}


@available(iOS 15.0, *)

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView()
        }
    }
}
