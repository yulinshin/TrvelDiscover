//
//  TileModifier.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/16.
//

import SwiftUI
extension View{
    func asTile() -> some View{
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(.white))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 3, x: 0, y: 2)
    }
}
