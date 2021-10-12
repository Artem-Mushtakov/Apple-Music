//
//  LibraryViewList.swift
//  Apple_Music
//
//  Created by Артем on 06.10.2021.
//

import SwiftUI

struct LibraryViewList: View {
    
    @State private var isEditMode = EditMode.active
    @State private var multiSelection = Set<String>()
    
    var body: some View {
        VStack {
            List(selection: $multiSelection) {
                ForEach(LibraryModel.data, id: \.self) { (item) in
                    HStack {
                        Image(systemName: "\(item.image)")
                            .foregroundColor(Color.red)
                        Text(item.title)
                    }
                }
                .onMove { (indexSet, index) in
                    LibraryModel.data.move(fromOffsets: indexSet,
                                           toOffset: index)
                }
            }.environment(\.editMode, $isEditMode)
                .listStyle(.inset)
                .accentColor(.red)
            PlayerView()
        }
    }
}

struct MediaLibraryList_Previews: PreviewProvider {
    static var previews: some View {
        LibraryViewList()
    }
}
