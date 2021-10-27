//
//  Home.swift
//  DesignCode
//
//  Created by Devesh Tyagi on 27/10/21.
//

import SwiftUI

struct Home: View {
    @State var showProfile : Bool = false
    @State var viewState : CGSize = .zero
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: { showProfile.toggle() }) {
                        Image("Avatar1")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
            .padding(.top , 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (10, 0, 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : 1000)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    showProfile.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            
                            viewState = value.translation
                        }
                        .onEnded{ value in
                            if viewState.height > 50 {
                                showProfile = false
                            }
                            viewState = .zero
                            
                        }
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
