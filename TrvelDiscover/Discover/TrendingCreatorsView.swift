//
//  TrendingCreatorsView.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/16.
//

import SwiftUI

struct TrendingCreatorsView:View {
    
    let creators: [Creator] = [
        .init(name: "Doudou", imageName: "pic1"),
        .init(name: "ELio", imageName: "pic2"),
        .init(name: "sarqe", imageName: "pic3"),
        .init(name: "EEeqw", imageName: "pic4"),
        .init(name: "Relwq", imageName: "pic5")
    ]
    
    
    var body: some View{
        VStack{
            HStack{
            Text("TrendingCreators")
                .font(.system(size: 14, weight: .medium))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .medium))
            
        }.padding(.horizontal)
        .padding(.top)
            
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    ForEach(creators , id: \.self) { creator in
                        VStack(spacing: 4){
                            Image(creator.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .background(Color.gray)
                                .cornerRadius(30)
                                .shadow(color: .gray, radius: 3, x: 0, y: 2 )
                            Text(creator.name)
                                .font(.system(size: 12, weight: .medium))
                        }
                    }
                   
                }.padding(.horizontal)
            }
            
        }

    }
}

struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
        DiscoverView()
    }
}
