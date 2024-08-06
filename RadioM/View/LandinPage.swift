//
//  LandinPage.swift
//  RadioM
//
//  Created by Erik Valigurský on 06/08/2024.
//

import Foundation
import SwiftUI



struct LandinPage: View {
    
    @State private var isActive: Bool = false
    @State private var opacity: Double = 1.0
    @State private var contentView = ContentView()

    private var firstHalf: String = "MÁ"
    private var secondHalf: String = "RIA"
    private var radio: String = "Rádio.   "
    

    var body: some View {
        
        if isActive {
//            withAnimation(.easeIn(duration: 5.0)) {
//                self.opacity(1.0)
//               
//            }
            contentView
           
        } else {
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(firstHalf)
                            .padding(.trailing)
                            .frame(idealWidth: 100)
                            .background(Color.blue)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                            .font(.system(size: 150)).bold()
                            .foregroundStyle(.background)
                            .padding(.bottom, -30)

                        Text(secondHalf)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .font(.system(size: 170))
                            .padding(.top, -30)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            .background(.pink)
                    
                    VStack {
                        Spacer()
                        Text(Image(systemName: "radio")) + Text(radio)
                            .font(.headline)
                    }
                }
//                .opacity(opacity)
//                .onAppear {
//                    withAnimation(.easeOut(duration: 2.0)) {
//                        self.opacity = 0.0
//                    }
//                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.isActive = true
                }
            }
        }
    }
}



#Preview {
    LandinPage()
}

