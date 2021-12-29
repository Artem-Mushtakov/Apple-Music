//
//  Search.swift
//  Apple_Music
//
//  Created by Артем on 04.12.2021.
//

import SwiftUI

struct SearchView: View {
    
    var columns = Array(
        repeating:GridItem(.flexible(),spacing: Metric.columnsSpacing),
        count: Metric.columnsCount)
    
    @State private var dataModel = RadioModelStations.data
    @State private var search = ""
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(spacing: Metric.vStackSpacing) {
                    
                    if search.isEmpty {
                        
                        Text("Поиск по категориям")
                            .foregroundColor(.black)
                            .font(.title2).bold()
                            .frame(width: Metric.searchFrameWidth,
                                   height: Metric.searchFrameHeight,
                                   alignment: .leading)
                            .padding(.bottom, Metric.paddingBottomCategory)
                            .padding(.top, Metric.paddingTopCategory)
                        
                        LazyVGrid(columns: columns) {
                            
                            ForEach(dataModel, id: \.id)  { data in
                                
                                ZStack {
                                    
                                    NavigationLink(destination: SearchCategoryView()) {
                                        
                                        Image(data.image)
                                            .resizable()
                                            .frame(width: Metric.imageFrameWidth,
                                                   height: Metric.imageFrameHeight,
                                                   alignment: .leading)
                                            .scaledToFill()
                                            .cornerRadius(Metric.imageCornerRadius)
                                    }
                                    
                                    Text(data.title)
                                        .bold()
                                        .frame(width: Metric.textFrameWidth,
                                               height: Metric.textFrameHeight,
                                               alignment: .bottomLeading)
                                        .foregroundColor(.white)
                                        .font(.system(size: Metric.fontSizeImageText))
                                        .scaledToFill()
                                        .padding(.leading, Metric.paddingLeadingImageText)
                                        .padding(.bottom, Metric.paddingBottomImageText)
                                }
                            }
                        }
                        .padding(.top, Metric.vStackPaddingTop)
                        .padding(.leading, Metric.vStackPaddingLeading)
                        .padding(.trailing, Metric.vStackPaddingTrailing)
                        
                    } else {
                        SearchResultView(searchText: $search)
                    }
                    
                }
                .padding()
                .padding(.bottom, Metric.navigationViewPaddingBottom)
            }
            .navigationBarTitle(Text("Поиск"))
            .searchable(text: $search,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Ваша медиатека")
        }
    }
}

extension SearchView {
    
    enum Metric {
        static let columnsSpacing: CGFloat = 20
        static let columnsCount = 2
        
        static let searchFrameWidth: CGFloat = 370
        static let searchFrameHeight: CGFloat = 20
        
        static let imageFrameWidth: CGFloat = 190
        static let imageFrameHeight: CGFloat = 140
        static let imageCornerRadius: CGFloat = 10
        
        static let textFrameWidth: CGFloat = 170
        static let textFrameHeight: CGFloat = 120

        static let vStackSpacing: CGFloat = 18
        static let vStackPaddingTop: CGFloat = 10
        static let vStackPaddingLeading: CGFloat = 10
        static let vStackPaddingTrailing: CGFloat = 10

        static let navigationViewPaddingBottom: CGFloat = 80

        static let paddingBottomCategory: CGFloat = 5
        static let paddingTopCategory: CGFloat = -5

        static let fontSizeImageText: CGFloat = 19
        static let paddingLeadingImageText: CGFloat = 10
        static let paddingBottomImageText: CGFloat = 19
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView()
        }
    }
}
