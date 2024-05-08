//
//  ContentView.swift
//  CaoCuladora
//
//  Created by João Vitor Lima Mergulhão on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var years: Int?
    @State var months: Int?
    
    @State var result: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cachorro?")
                .font(.system(size: 24))
            
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
            
            Text("Porte")
            // segmented control
            
            if let result {
                Text("Seu Cachorro tem, em idade canina...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .shadow(radius: 20)
            }
            
            Button(action: {
                result = 23
            }, label: {
                ZStack{
                    Color.indigo
                    Text("CãoCular")
                        .foregroundStyle(.white)
                }
            })
            .cornerRadius(10)
            .frame(height: 50)
            
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
