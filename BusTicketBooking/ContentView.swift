//
//  ContentView.swift
//  BusTicketBooking
//  Roll: 2107042, 2107049, 2107056
//  Created by macos on 26/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            OffersView()
                .tabItem {
                    Label("Offers", systemImage: "percent")
                }

            TicketsView()
                .tabItem {
                    Label("Tickets", systemImage: "ticket.fill")
                }

            MoreView()
                .tabItem {
                    Label("More", systemImage: "ellipsis.circle")
                }
        }
        .accentColor(Theme.primaryMaroon)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
