//
//  SearchCategoryView.swift
//  Apple_Music
//
//  Created by Артем on 30.11.2021.
//

import SwiftUI

struct SearchCategoryView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading) {
                SearchCategoryBanner()
                
                HStack {
                    
                    Text("Настроение - осень")
                        .font(.title2).bold()
                        .padding(.leading, Metric.textPaddingLeading)
                        .padding(.trailing, Metric.textPaddingTrailing)
                    
                    Text("Cм. все")
                        .foregroundColor(.red)
                }
                SearchCategoryCell()
            }
        }
        .navigationBarTitle(Text("Зимнее время"))
        .navigationBarItems(trailing: Button(action: { }, label: {
            Image(systemName: "ellipsis.circle")
                .foregroundColor(.red)
        }))
        .accentColor( .black)
        .padding(.bottom, Metric.vStackBottomPadding)
    }
}

extension SearchCategoryView {

    enum Metric {
        static let textPaddingLeading: CGFloat = 8
        static let textPaddingTrailing: CGFloat = 90

        static let vStackBottomPadding: CGFloat = 35
    }
}

struct SearchCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategoryView()
    }
}
