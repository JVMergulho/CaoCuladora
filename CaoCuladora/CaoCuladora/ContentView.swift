//
//  ContentView.swift
//  CaoCuladora
//
//  Created by João Vitor Lima Mergulhão on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var years: Int? = nil
    @State var months: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cachorro?")
            
            Text("Anos")
            TextField(
                "Quantos anos completos seu cão tem?",
                value: $years,
                format: .number
            )
            Text("Meses")
            TextField(
                "E quantos meses além disso ele tem?",
                value: $years,
                format: .number
            )
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
        .padding()
    }
}

#Preview {
    ContentView()
}
