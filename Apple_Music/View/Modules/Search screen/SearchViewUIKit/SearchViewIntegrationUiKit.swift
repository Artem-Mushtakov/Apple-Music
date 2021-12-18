//
//  SearchViewIntegrationUiKit.swift
//  Apple_Music
//
//  Created by Артем on 18.12.2021.
//

import SwiftUI
import UIKit

struct SearchViewIntegrationUiKit: UIViewControllerRepresentable {

    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return AlbumsViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct SearchViewIntegrationUiKit_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewIntegrationUiKit()
    }
}
