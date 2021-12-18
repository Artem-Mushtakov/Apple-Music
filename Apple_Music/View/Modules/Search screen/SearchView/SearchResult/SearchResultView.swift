//
//  SearchResultView.swift
//  Apple_Music
//
//  Created by Артем on 30.11.2021.
//

import SwiftUI

struct SearchResultView: View {
    
    @State private var didTapLeft = true
    @State private var didTapRight = false
    @State private var didTap = true
    @Binding var searchText: String
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: Metric.buttonBackgroundCornerRadius)
                        .foregroundColor(.gray)
                        .opacity(0.4)
                        .frame(width: Metric.buttonBackgroundFrameWidth,
                               height: Metric.buttonBackgroundFrameHeight)
                    
                    HStack {
                        
                        Button {
                            didTap = true
                            didTapRight = false
                            didTapLeft.toggle()
                            
                        } label: {
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: Metric.buttonLeftCornerRadius)
                                    .frame(width: Metric.buttonLeftFrameWidth,
                                           height: Metric.buttonLeftFrameHeight)
                                    .foregroundColor(
                                        (didTapLeft ? Color.gray : Color.clear))
                                
                                Text("Apple Music")
                                    .foregroundColor(
                                        (didTapLeft ? Color.white : Color.black))
                                    .bold()
                            }
                        }
                        
                        Button {
                            didTap = true
                            didTapLeft = false
                            self.didTapRight.toggle()
                        } label: {
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: Metric.buttonRightCornerRadius)
                                    .frame(width: Metric.buttonRightFrameWidth,
                                           height: Metric.buttonRightFrameHeight)
                                    .foregroundColor((didTapRight ? Color.gray : Color.clear))
                                
                                Text("Ваша медиатека")
                                    .foregroundColor((didTapRight ? Color.white : Color.black))
                                    .bold()
                            }
                        }
                    }
                }
                
                if didTap {
                    switch didTapLeft {
                    case true:
                        VStack {
SearchViewIntegrationUiKit()
                            //SearchResultAppleMusic(searchText: $searchText)
                        }
                    case false:
                        VStack {
                            SearchResultLibrary()
                        }
                    }
                }
            }
        }
    }
}

extension SearchResultView {

    enum Metric {
        static let buttonBackgroundFrameWidth: CGFloat = 370
        static let buttonBackgroundFrameHeight: CGFloat = 40
        static let buttonBackgroundCornerRadius: CGFloat = 10

        static let buttonLeftFrameWidth: CGFloat = 185
        static let buttonLeftFrameHeight: CGFloat = 40
        static let buttonLeftCornerRadius: CGFloat = 10

        static let buttonRightFrameWidth: CGFloat = 185
        static let buttonRightFrameHeight: CGFloat = 40
        static let buttonRightCornerRadius: CGFloat = 10
    }
}

struct SearchResultView_Previews: PreviewProvider {
    
    @State static var searchTextPreviews = ""
    
    static var previews: some View {
        SearchResultView(searchText: $searchTextPreviews)
    }
}
