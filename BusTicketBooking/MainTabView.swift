//
//  MainTabView.swift
//  BusTicketBooking
//
//  Created by macos on 26/2/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            OffersView()
                .tabItem {
                    Image(systemName: "percent")
                    Text("Offers")
                }

            TicketsView()
                .tabItem {
                    Image(systemName: "ticket.fill")
                    Text("Tickets")
                }

            MoreView()
                .tabItem {
                    Image(systemName: "ellipsis.circle")
                    Text("More")
                }
        }
        .accentColor(Theme.primaryMaroon)
    }
}
