//
//  ContentView.swift
//  CombineAPi
//
//  Created by 강민규 on 2022/09/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        Button {
            viewModel.getDatas(cityName: "Busan")
        } label: {
            Text("Click ME")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
