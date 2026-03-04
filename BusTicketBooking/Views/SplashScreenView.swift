//
//  SplashScreenView.swift
//  BusTicketBooking
//
//  Created for BusTicketBooking App
//

import SwiftUI

struct SplashScreenView: View {
    @State private var busOffset: CGFloat = -400
    @State private var titleOpacity: Double = 0
    @State private var subtitleOpacity: Double = 0
    @State private var scaleEffect: CGFloat = 0.6
    @State private var dotAnimation = false
    @State private var roadOpacity: Double = 0
    @State private var glowOpacity: Double = 0

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Theme.primaryMaroon,
                    Theme.lightMaroon,
                    Theme.primaryMaroon.opacity(0.85)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            // Decorative circles in background
            Circle()
                .fill(Color.white.opacity(0.05))
                .frame(width: 300, height: 300)
                .offset(x: -120, y: -280)

            Circle()
                .fill(Color.white.opacity(0.04))
                .frame(width: 200, height: 200)
                .offset(x: 150, y: 350)

            Circle()
                .fill(Color.white.opacity(0.03))
                .frame(width: 150, height: 150)
                .offset(x: 130, y: -200)

            VStack(spacing: 0) {
                Spacer()

                // Bus icon with glow
                ZStack {
                    // Glow effect behind bus
                    Image(systemName: "bus.fill")
                        .font(.system(size: 90))
                        .foregroundColor(.white.opacity(0.3))
                        .blur(radius: 20)
                        .opacity(glowOpacity)

                    Image(systemName: "bus.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .scaleEffect(scaleEffect)
                .offset(x: busOffset)

                // Road line
                HStack(spacing: 12) {
                    ForEach(0..<7, id: \.self) { i in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 30, height: 3)
                    }
                }
                .padding(.top, 12)
                .opacity(roadOpacity)

                // App title
                VStack(spacing: 8) {
                    Text("Bus Ticket")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    +
                    Text(" Booking")
                        .font(.system(size: 36, weight: .light, design: .rounded))
                        .foregroundColor(.white.opacity(0.9))
                }
                .opacity(titleOpacity)
                .padding(.top, 30)

                // Subtitle
                Text("Your Journey, Our Priority")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
                    .opacity(subtitleOpacity)
                    .padding(.top, 8)

                Spacer()

                // Loading dots
                HStack(spacing: 8) {
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 8, height: 8)
                            .scaleEffect(dotAnimation ? 1.0 : 0.5)
                            .opacity(dotAnimation ? 1.0 : 0.3)
                            .animation(
                                Animation.easeInOut(duration: 0.6)
                                    .repeatForever(autoreverses: true)
                                    .delay(Double(index) * 0.2),
                                value: dotAnimation
                            )
                    }
                }
                .padding(.bottom, 60)

                // Footer text
                Text("Roll: 2107042, 2107049, 2107056")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.white.opacity(0.4))
                    .opacity(subtitleOpacity)
                    .padding(.bottom, 30)
            }
        }
        .onAppear {
            // Bus drives in from left
            withAnimation(.spring(response: 0.8, dampingFraction: 0.65, blendDuration: 0)) {
                busOffset = 0
                scaleEffect = 1.0
            }

            // Road appears
            withAnimation(.easeIn(duration: 0.5).delay(0.4)) {
                roadOpacity = 1
            }

            // Glow pulses in
            withAnimation(.easeInOut(duration: 1.0).delay(0.3)) {
                glowOpacity = 1
            }

            // Title fades in
            withAnimation(.easeIn(duration: 0.6).delay(0.6)) {
                titleOpacity = 1
            }

            // Subtitle fades in
            withAnimation(.easeIn(duration: 0.6).delay(1.0)) {
                subtitleOpacity = 1
            }

            // Start dot animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                dotAnimation = true
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
