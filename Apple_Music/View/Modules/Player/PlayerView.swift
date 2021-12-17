//
//  LibraryPlayer.swift
//  Apple_Music
//
//  Created by Артем on 05.10.2021.
//

import SwiftUI

struct PlayerView: View {
    
    @Binding var expand: Bool
    
    @State var volume: CGFloat = 0
    @State var offset: CGFloat = 0
    
    var animation: Namespace.ID
    var height = UIScreen.main.bounds.height / 3
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets

    var body: some View {
        
        VStack {
            
            Capsule()
                .fill()
                .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                .opacity(expand ? 1 : 0)
                .padding(.top, expand ? safeArea?.top : 0)
                .padding(.vertical, expand ? 30 : 0)
            
            HStack(spacing: 15) {
                
                if expand { Spacer(minLength: 0) }
                
                Image("michaelkrugPlayer")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: expand ? height : 50, height: expand ? height : 50)
                    .cornerRadius(10)
                
                if !expand {
                    Text("Михаил Круг - Золотые купола")
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "Label", in: animation)
                }
                
                Spacer(minLength: 0)
                
                if !expand {
                    Button {} label: {
                        Image(systemName: "play.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button {} label: {
                        Image(systemName: "forward.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
            
            VStack(spacing: 15) {
                
                Spacer(minLength: 0)
                
                HStack {
                    if expand {
                        Text("Михаил Круг - Золотые купола")
                            .matchedGeometryEffect(id: "Label", in: animation)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button { } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding()
                .padding(.top, 20)
                
                HStack {
                    
                    Text("00:30")
                        .font(.system(size: 12))
                    
                    Slider(value: $volume)
                    
                    Text("3:40")
                        .font(.system(size: 12))
                }
                .padding()
                
                Spacer(minLength: 0)
                
                HStack(spacing: 15) {
                    
                    Button {} label: {
                        
                        Image(systemName: "backward.fill")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    
                    Button {} label: {
                        
                        Image(systemName: "stop.fill")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    
                    Button {} label: {
                        
                        Image(systemName: "forward.fill")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }
                    .padding()
                }
                Spacer(minLength: 0)
                
                HStack(spacing: 15) {
                    Image(systemName: "speaker.fill")
                    Slider(value: $volume)
                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding()
                
                HStack(spacing: 80) {
                    
                    Button { } label: {
                        
                        Image(systemName: "arrow.up.message")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button { } label: {
                        
                        Image(systemName: "airplayaudio")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button { } label: {
                        
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
            }
            .frame(height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
        }
        .frame(maxHeight: expand ? .infinity : 60)
        .background(
            
            VStack(spacing: 0) {
                PlayerBlurView()
                Divider()
            }
                .onTapGesture {
                    withAnimation(.spring()) {
                        expand = true
                    }
                })
        .cornerRadius(expand ? 20 : 0)
        .offset(y: expand ? 0 : -48)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
        .ignoresSafeArea()
    }
    
    func onChanged(value: DragGesture.Value) {
        
        if value.translation.height > 0 && expand {
            
            offset = value.translation.height
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            
            if value.translation.height > height {
                expand = false
            }
            offset = 0
        }
    }
}
