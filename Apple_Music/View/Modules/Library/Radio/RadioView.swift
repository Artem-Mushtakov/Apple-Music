//
//  RadioView.swift
//  Apple_Music
//
//  Created by Артем on 16.10.2021.
//

import SwiftUI

struct RadioView: View {
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    RadioExclusiveView()
                    Spacer()
                    RadioStationsView()
                }
                .navigationBarTitle(Text("Радио"))
            }
        }
        .padding(.bottom)
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
