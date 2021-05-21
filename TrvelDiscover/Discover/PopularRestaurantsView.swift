//
//  PopularRestaurantsView.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/16.
//

import SwiftUI

struct PopularRestaurantsView:View {
    
    let restaurants: [Restaurant] = [
        .init(name: "Shijia Tangyuan", imageName: "Shijia Tangyuan", location: "Taipei", rate: "4.5", type: "Asian", price: "$$"), .init(name: "JustIn", imageName: "JustIn", location: "Kaohsiung", rate: "4.7", type: "Bar", price: "$$")
    ]
    
    var body: some View{
        VStack{
            HStack{
            Text("Popular places to eat")
                .font(.system(size: 14, weight: .medium))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .medium))
            
        }.padding(.horizontal)
        .padding(.top)
            
            ScrollView(.horizontal){
                HStack(spacing: 8){
                    ForEach(restaurants, id: \.self){ restaurant in
                        HStack(spacing: 6){
                        Image(restaurant.imageName)
                            .resizable()
                            .scaledToFill()
                            
                            .frame(width: 64, height: 64)
                            .clipped()
                            VStack(alignment: .leading, spacing: 6){
                                HStack{
                                    Text(restaurant.name)
                                    Spacer()
                                    Image(systemName: "ellipsis")
                                }
                                HStack{
                                    Image(systemName: "star.fill")
                                    Text("\(restaurant.rate)/ \(restaurant.type) \(restaurant.price)")
                                }
                                Text(restaurant.location)
                                
                        }.font(.system(size: 12,weight: .semibold))
                            
                        Spacer()
                              
                        }.frame(width:220)
                        .asTile()
                        .padding(.bottom)
                        
                    }
                   
                }.padding(.horizontal)
            }
            
        }

    }
}
struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
        DiscoverView()
    }
}
