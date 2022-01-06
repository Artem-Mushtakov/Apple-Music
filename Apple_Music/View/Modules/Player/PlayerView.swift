//
//  LibraryPlayer.swift
//  Apple_Music
//
//  Created by Артем on 05.10.2021.
//

import SwiftUI

struct PlayerView: View {
    
    @Binding var expand: Bool
    
    @State var volume: CGFloat = Metric.volume
    @State var trackTime: CGFloat = Metric.trackTime
    @State var offset: CGFloat = Metric.offset
    
    var animation: Namespace.ID
    var height = UIScreen.main.bounds.height / Metric.heightScreen
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets

    var body: some View {
        
        VStack {
            
            Capsule()
                .fill()
                .frame(width: expand ? Metric.widthFrameCapsule : Metric.anotherParametr,
                       height: expand ? Metric.heightFrameCapsule : Metric.anotherParametr)
                .opacity(expand ? Metric.opacityCapsule : Metric.anotherParametr)
                .padding(.top, expand ? safeArea?.top : Metric.anotherParametr)
                .padding(.vertical, expand ? Metric.paddingCapsule : Metric.anotherParametr)
            
            HStack(spacing: Metric.hStackImageSpacing) {
                
                if expand { Spacer(minLength: Metric.spacerMinLength) }
                
                Image("michaelkrugPlayer")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: expand ? height : Metric.heightImage, height: expand ? height : Metric.heightImage)
                    .cornerRadius(Metric.cornerRadiusImage)
                
                if !expand {
                    Text("Михаил Круг - Золотые купола")
                        .lineLimit(Metric.lineLimit)
                        .matchedGeometryEffect(id: "Label", in: animation)
                }
                
                Spacer(minLength: Metric.spacerMinLength)
                
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
            
            VStack(spacing: Metric.vStackPlayerSpacing) {
                
                Spacer(minLength: Metric.spacerMinLength)
                
                HStack {
                    if expand {
                        Text("Михаил Круг - Золотые купола")
                            .matchedGeometryEffect(id: "Label", in: animation)
                    }
                    
                    Spacer(minLength: Metric.spacerMinLength)
                    
                    Button { } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding()
                .padding(.top, Metric.vStackPlayerPaddingTop)
                
                HStack {
                    
                    Text("00:30")
                        .font(.system(size: Metric.timeTrackFontSize))
                    
                    Slider(value: $trackTime)
                    
                    Text("3:40")
                        .font(.system(size: Metric.timeTrackFontSize))
                }
                .padding()
                
                Spacer(minLength: Metric.spacerMinLength)
                
                HStack(spacing: Metric.hStackPlayerButtonSpacing) {
                    
                    Button {} label: {
                        
                        Image(systemName: "backward.fill")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    
                    Button {} label: {
                        
                        Image(systemName: "play.fill")
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
                Spacer(minLength: Metric.spacerMinLength)
                
                HStack(spacing: Metric.hStackVolumeScrollSpacing) {
                    Image(systemName: "speaker.fill")
                    Slider(value: $volume)
                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding()
                
                HStack(spacing: Metric.hStackDownButtonSpacing) {
                    
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
                .padding(.bottom, safeArea?.bottom == Metric.anotherParametr ? Metric.hStackDownButtonPaddingBottom : safeArea?.bottom)
            }
            .frame(height: expand ? nil : Metric.anotherParametr)
            .opacity(expand ? Metric.hStackDownButtonOpacity : Metric.anotherParametr)
        }
        .frame(maxHeight: expand ? .infinity : Metric.maxHeightFrame)
        .background(
            
            VStack(spacing: Metric.anotherParametr) {
                PlayerBlurView()
                Divider()
            }
                .onTapGesture {
                    withAnimation(.spring()) {
                        expand = true
                    }
                })
        .cornerRadius(expand ? Metric.cornerRadius : Metric.anotherParametr)
        .offset(y: expand ? Metric.anotherParametr : Metric.offsetY)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded(value:)).onChanged(onChanged(value:)))
        .ignoresSafeArea()
    }
    
    func onChanged(value: DragGesture.Value) {
        
        if value.translation.height > Metric.anotherParametr && expand {
            
            offset = value.translation.height
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        
        withAnimation(.interactiveSpring(response: Metric.responce, dampingFraction: Metric.dampingFraction, blendDuration: Metric.blendDuration)) {
            
            if value.translation.height > height {
                expand = false
            }
            offset = Metric.offset
        }
    }
}

extension PlayerView {
    enum Metric {
        static let heightScreen: CGFloat = 3
        static let volume: CGFloat = 0
        static let offset: CGFloat = 0
        static let trackTime: CGFloat = 0
        static let widthFrameCapsule: CGFloat = 60
        static let heightFrameCapsule: CGFloat = 4
        static let anotherParametr: CGFloat = 0
        static let opacityCapsule: CGFloat = 1
        static let paddingCapsule: CGFloat = 30
        static let spacerMinLength: CGFloat = 0
        static let heightImage: CGFloat = 50
        static let widthImage: CGFloat = 40
        static let cornerRadiusImage: CGFloat = 10
        static let lineLimit: Int = 1
        static let hStackImageSpacing: CGFloat = 15
        static let vStackPlayerSpacing: CGFloat = 15
        static let vStackPlayerPaddingTop: CGFloat = 20
        static let timeTrackFontSize: CGFloat = 12
        static let hStackPlayerButtonSpacing: CGFloat = 15
        static let hStackVolumeScrollSpacing: CGFloat = 15
        static let hStackDownButtonSpacing: CGFloat = 80
        static let hStackDownButtonPaddingBottom: CGFloat = 15
        static let hStackDownButtonOpacity: CGFloat = 1
        static let maxHeightFrame: CGFloat = 60
        static let cornerRadius: CGFloat = 20
        static let offsetY: CGFloat = -48
        static let responce: CGFloat = 0.5
        static let dampingFraction: CGFloat = 0.95
        static let blendDuration: CGFloat = 0.95
    }
}
