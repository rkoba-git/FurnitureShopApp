//
//  DetailScreen.swift
//  FurnitureShopApp
//
//  Created by 小林麟太郎 on 2023/01/13.
//

import SwiftUI

struct DetailScreen: View {
    let itemName: String
    let descriptionText: String
    let itemImage: Image
    @Environment(\.presentationMode)  var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                itemImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                
                DescriptionView(itemName: itemName, descriptionText: descriptionText)
                    .offset(y: -40)
            }
            .edgesIgnoringSafeArea(.top)
            
            
            
            VStack {
                Spacer()
                HStack{
                    Text("$1299")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Add to Cart")
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10.0)
                            .foregroundColor(Color("Primary"))
                    })
                }
                .padding()
                .background(Color("Primary"))
                .cornerRadius(50, corners: .topLeft)
            }
            .edgesIgnoringSafeArea(.bottom)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButtonView(action: {presentationMode.wrappedValue.dismiss()}),trailing: Image("threeDot")
                            )
    }
}


struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(itemName: "Luruxy Swedia \nChair1", descriptionText: "Luruxy Swedia Chair\nポップカラーがカジュアルでかわいい白脚＆黒脚キャスターチェアです。デスクチェアだけでなく、ダイニングチェア、メイク用チェアとしてもおすすめです。独特の曲線が体にフィットして、疲れにくい。", itemImage: Image("chair_1"))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DescriptionView: View {
    let itemName: String
    let descriptionText: String
    var body: some View {
        VStack(alignment: .leading){
            Text(itemName)
                .font(.title)
                .fontWeight(.bold)
            
            HStack (spacing: 4){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading,8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text(descriptionText)
                .lineSpacing(8.0)
                .opacity(0.6)
            HStack(alignment: .top){
                VStack(alignment: .leading) {
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    Text("Jati Wood, Canvas, \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .padding(.vertical)
            
            HStack (alignment: .bottom){
                VStack (alignment: .leading){
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack{
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: Color("Primary"))
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    
                    HStack{
                        Button(action: {}){
                            Image(systemName: "minus")
                                .padding(.all,8)
                        }
                        .frame(width: 30, height: 30)
                        //丸枠線を上から重ね合わせる
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal,8)
                        
                        Button(action: {}){
                            Image(systemName: "plus")
                                .padding(.all,8)
                        }
                        //.frame(width: 30, height: 30)
                        //丸枠線を上から重ね合わせる
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}



struct CustomBackButtonView: View {
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .padding(.all,10)
                .background(Color.white)
                .cornerRadius(8.0)
                .foregroundColor(.black)
        })

    }
}
