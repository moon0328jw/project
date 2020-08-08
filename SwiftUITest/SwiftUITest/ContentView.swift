//
//  ContentView.swift
//  SwiftUITest
//
//  Created by 문주원 on 2020/06/03.
//  Copyright © 2020 문주원. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World \naaaaaaaaaaaaaaaaaaa")
            .lineLimit(4)
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .foregroundColor(.blue)
            .background(Color.green)
            .lineSpacing(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
