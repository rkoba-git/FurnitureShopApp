//
//  ContentView.swift
//  FurnitureShopApp
//
//  Created by 小林麟太郎 on 2023/01/10.
//

import SwiftUI

struct ContentView: View {
    @State private var search: String = ""
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            VStack (alignment: .leading){
                AppBarView()
                
                TagLineView()
                    .padding()
                
                SearchAndScanView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
            .padding(.horizontal)
            
            Button(action: {}) {
                Image("scan-line")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
    }
}
