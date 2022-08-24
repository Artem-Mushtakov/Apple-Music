//
//  BlurView.swift
//  Apple_Music
//
//  Created by Артем on 04.12.2021.
//

import SwiftUI

struct PlayerBlurView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
}
