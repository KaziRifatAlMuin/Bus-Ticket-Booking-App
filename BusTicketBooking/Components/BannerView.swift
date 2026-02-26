//
//  BannerView.swift
//  BusTicketBooking
//
//  Created by macos on 26/2/26.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Theme.primaryMaroon, Theme.lightMaroon]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .cornerRadius(20)

            VStack(alignment: .leading, spacing: 8) {
                Text("Bus Ticket Booking")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)

                Text("Book bus tickets at the best prices")
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding()
        }
        .frame(height: 150)
    }
}
