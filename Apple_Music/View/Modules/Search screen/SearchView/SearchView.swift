//
//  Search.swift
//  Apple_Music
//
//  Created by Артем on 04.12.2021.
//

import SwiftUI

struct SearchView: View {
    
    var columns = Array(
        repeating: GridItem(.flexible(), spacing: Metric.columnsSpacing),
        count: Metric.columnsCount)
    
    @State private var dataModel = RadioModelStations.data
    @State private var search = ""
    
    var body: some View {
        
        NavigationView {

            VStack(spacing: Metric.vStackSpacing) {

                if search.isEmpty {

                    Text("Поиск по категориям")
                        .foregroundColor(.black)
                        .font(.title2).bold()
                        .frame(width: Metric.searchFrameWidth,
                               height: Metric.searchFrameHeight,
                               alignment: .leading)
                        .padding(.bottom,Metric.textPaddingBottom)
                        .padding(.top, Metric.textPaddingTop)

                    SearchViewIntegrationUiKit()
                } else {

                    SearchResultView(searchText: $search)
                }
            }
            .navigationBarTitle(Text("Поиск"))

        }
        .searchable(text: $search,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Ваша медиатека")
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
        static let textPaddingBottom: CGFloat = 5
        static let textPaddingTop: CGFloat = -5

        static let vStackSpacing: CGFloat = 18
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView()
        }
    }
}
