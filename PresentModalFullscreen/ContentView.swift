//
//  ContentView.swift
//  PresentModalFullscreen
//
//  Created by Punde, Rasika Nanasaheb on 30/05/20.
//  Copyright © 2020 Punde, Rasika Nanasaheb (US - Mumbai). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showingDetail = false

    var body: some View {
        ZStack{
            Color.red
            VStack {
                Button(action: {
                    withAnimation {
                        self.showingDetail.toggle()
                    }
                }) {
                    Text("Show Details")
                }
            }
            DetailView(isPresented: self.$showingDetail).edgesIgnoringSafeArea(.all)
                .offset(x: 0, y: self.showingDetail ? 0 : UIApplication.shared.keyWindow?.frame.height ?? 0)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct DetailView: View {
    @Binding var isPresented : Bool
    var body: some View {
        ZStack {
            Color.blue
            Button("Dismiss") {
                withAnimation {
                    self.isPresented.toggle()
                }
            }.foregroundColor(.white)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
