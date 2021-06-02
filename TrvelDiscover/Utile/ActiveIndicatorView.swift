//
//  ActiveIndicatorView.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/21.
//

import SwiftUI
struct ActiveIndicatorView: UIViewRepresentable {  //製作UIKIT物件
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = UIColor.white
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
   
    typealias UIViewType = UIActivityIndicatorView
    
    
}
