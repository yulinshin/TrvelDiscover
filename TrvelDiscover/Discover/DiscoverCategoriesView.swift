//
//  DiscoverCategoriesView.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/16.
//

import SwiftUI


struct DiscoverCategoriesView: View {
    
    let categories : [Catrgory] = [
        .init(name: "Art", imagename: "paintpalette.fill"),
        .init(name: "Sport", imagename: "sportscourt.fill"),
        .init(name: "Live Events", imagename: "music.mic"),
        .init(name: "Food", imagename: "seal.fill"),
        .init(name: "History", imagename: "books.vertical.fill"),
        .init(name: "Traffic", imagename: "tram")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top, spacing: 8){
                ForEach(categories, id: \.self) { category in
                    
                  NavigationLink(
                    destination: CategoryDetialView(),
                    label: {
                        VStack(spacing: 6){
                            Image(systemName: category.imagename)
                                .font(.system(size: 24)) // 用fontsize 控制 systemImage大小
                                .foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.45997468, blue: 0.1921568662, alpha: 1)))
                                .frame(width: 60, height: 60)
                                .background(Color.white)
                                .cornerRadius(30) // 圖片無法使用用.indinity
                            Text(category.name)
                                .font(.system(size: 12, weight: .medium))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }.frame(width:70)
                    })
                  
                }
            }.padding(.horizontal)
         
        }
    }
}


struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
        
    }
}
