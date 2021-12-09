//
//  SearchResultView.swift
//  Apple_Music
//
//  Created by Артем on 30.11.2021.
//

import SwiftUI

@available(iOS 15.0, *)

struct SearchResultView: View {
    
    @State private var didTapLeft = true
    @State private var didTapRight = false
    @State private var didTap = true
    @Binding var searchText: String
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.gray)
                        .opacity(0.4)
                        .frame(width: 370, height: 40)
                    
                    HStack {
                        
                        Button {
                            didTap = true
                            didTapRight = false
                            didTapLeft.toggle()
                            
                        } label: {
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 185, height: 40)
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
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 185, height: 40)
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
                            SearchResultAppleMusic(searchText: $searchText)
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

@available(iOS 15.0, *)

struct SearchResultView_Previews: PreviewProvider {
    
    @State static var searchTextPreviews = ""
    
    static var previews: some View {
        SearchResultView(searchText: $searchTextPreviews)
    }
}
