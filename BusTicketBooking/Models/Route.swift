//
//  Route.swift
//  BusTicketBooking
//
//  Created by macos on 26/2/26.
//

import Foundation

struct Route: Identifiable {
    let id = UUID()
    let from: String
    let to: String
    let price: String
}
