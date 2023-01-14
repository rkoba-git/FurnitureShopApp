//
//  HomeScreen.swift
//  FurnitureShopApp
//
//  Created by 小林麟太郎 on 2023/01/13.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    private let itemNames = ["Luruxy Swedia \nChair1","Luruxy Swedia \nChair2","Luruxy Swedia \nChair3","Luruxy Swedia \nChair4","Luruxy Swedia \nChair5"]
    private let desprictionText = ["Luruxy Swedia Chair\nポップカラーがカジュアルでかわいい白脚＆黒脚キャスターチェアです。デスクチェアだけでなく、ダイニングチェア、メイク用チェアとしてもおすすめです。独特の曲線が体にフィットして、疲れにくい。","Luruxy Swedia Chair\nポップカラーがカジュアルでかわいい白脚＆黒脚キャスターチェアです。デスクチェアだけでなく、ダイニングチェア、メイク用チェアとしてもおすすめです。独特の曲線が体にフィットして、疲れにくい。","Luruxy Swedia Chair\nポップカラーがカジュアルでかわいい白脚＆黒脚キャスターチェアです。デスクチェアだけでなく、ダイニングチェア、メイク用チェアとしてもおすすめです。独特の曲線が体にフィットして、疲れにくい。","Luruxy Swedia Chair\nポップカラーがカジュアルでかわいい白脚＆黒脚キャスターチェアです。デスクチェアだけでなく、ダイニングチェア、メイク用チェアとしてもおすすめです。独特の曲線が体にフィットして、疲れにくい。","Luruxy Swedia Chair\nポップカラーがカジュアルでかわいい白脚＆黒脚キャスターチェアです。デスクチェアだけでなく、ダイニングチェア、メイク用チェアとしてもおすすめです。独特の曲線が体にフィットして、疲れにくい。"]
    
    var body: some View {
       NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack (alignment: .leading){
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            //.horizontalで横スクロール
                            HStack{
                                ForEach(0 ..< categories.count) { i in
                                    //iはそれぞれのviewの番号
                                    //番号がselectedIndexと等しくなったら下線が増える
                                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                                
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    //assetの名前をあらかじめ数字で管理しておくのはあり
                                    NavigationLink(destination: DetailScreen(itemName: itemNames[index], descriptionText: desprictionText[index], itemImage: Image("chair_\(index + 1)")), label:{ ProductCardView(image:Image("chair_\(index + 1)"), size: 210)
                                    })
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                    
                                }
                                .padding(.trailing)
                                
                            }
                            .padding(.leading)
                        }
                        
                        Text("2022 Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    //assetの名前をあらかじめ数字で管理しておくのはあり
                                    ProductCardView(image:Image("chair_\(index + 1)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                    }
                }
                
                // Custom Navbar
                
                HStack{
                    BottomNavBarItem(image: Image("Home"), action: {})
                    BottomNavBarItem(image: Image("heart-1"), action: {})
                    BottomNavBarItem(image: Image("shopping-cart"), action: {})
                    BottomNavBarItem(image: Image("User"), action: {})
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {
                //ボタンが押されたときの処理
            }) {
                //タップされるボタンのデザイン
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {}){
                Image("profile_2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42, height: 42)
                    .clipShape(Rectangle())
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary")
            )
        
        + Text("Funiture")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary")
            )
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing, 8)
                TextField("家具を検索する", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            
            Button(action: {}) {
                Image("scan-line")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
            if(isActive){
                //isActiveがtrueになった時下線が登場
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label:{
                image
            .frame(maxWidth: .infinity)
        })
    }
}
