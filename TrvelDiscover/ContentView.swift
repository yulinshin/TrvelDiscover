//
//  ContentView.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView(){
                DiscoverCategoriesView()
                PopularDestinationsView()
                PopularRestautantView()
                TrendingCreatorsView()
                
            
            
            }.navigationTitle("Discover")
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
 ///COMPONENTS


struct TrendingCreatorsView:View {
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
                HStack(spacing: 8){
                    ForEach(0..<15, id: \.self) { num in
                        VStack(spacing: 4){
                            Spacer()
                                .frame(width: 50, height: 50)
                                .background(Color.gray)
                                .cornerRadius(.infinity) // 用.indinity 確保圓型
                                .shadow(color: .gray, radius: 3, x: 0, y: 2 )
                            Text("name")
                                .font(.system(size: 12, weight: .medium))
                        }
                    }
                   
                }.padding(.horizontal)
            }
            
        }

    }
}



struct PopularRestautantView:View {
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
                    ForEach(0..<5, id: \.self){ num in
                        Spacer()
                            .frame(width:200, height: 100   )
                            .background(Color.gray)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 3, x: 0, y: 2)
                            .padding(.bottom)
                    }
                   
                }.padding(.horizontal)
            }
            
        }

    }
}

struct Destination: Hashable {
    var name, city, imageName : String
}


struct PopularDestinationsView:View {
    
    let destinations: [Destination] = [
        .init(name: "Caoling Historic Trail", city: "Yilan", imageName: "Caoling Historic Trail, Yilan County"),
        .init(name: "Taoyuan Valley", city: "Yilan", imageName: "Taoyuan Valley, Yilan"),
        .init(name: "Chishang Township", city: "Taitung", imageName: "Chishang Township, Taitung County")
        
    ]
    
    var body: some View{
        VStack{
            HStack{
            Text("Popular destionations")
                .font(.system(size: 14, weight: .medium))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .medium))
            
        }.padding(.horizontal)
        .padding(.top)
            
            ScrollView(.horizontal){
                HStack(spacing: 8){
                    ForEach(destinations, id: \.self){ destination in
                            
                        VStack(alignment: .leading){
                                Image(destination.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 120)
                                Text(destination.name)
                                  .font(.system(size: 14, weight: .medium))
                                    .padding(.horizontal, 4)
                                Text(destination.city)
                                  .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 4)
                                Spacer()
                                  
                            }
                        .frame(width: 150, height: 170)
                        .background(Color(.white))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 0, y: 2)
                        .padding(.bottom)
                         
                        }
                          
                   
                }.padding(.horizontal)
            }
            
        }

    }
}



struct Catrgory: Hashable { // 可標示的
    let name, imagename: String
}

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
                    VStack(spacing: 6){
                        Image(systemName: category.imagename)
                            .font(.system(size: 24)) // 用fontsize 控制 systemImage大小
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(Color.gray)
                            .cornerRadius(30) // 圖片無法使用用.indinity
                            .shadow(color: .gray, radius: 3, x: 0, y: 2 )
                        Text(category.name)
                            .font(.system(size: 12, weight: .medium))
                            .multilineTextAlignment(.center)
                    }.frame(width:70)
                }
            }.padding(.horizontal)
         
        }
    }
}
