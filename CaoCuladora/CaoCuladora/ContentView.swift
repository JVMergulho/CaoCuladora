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
    @State var dogSize: Size = .small
                    
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
                value: $months,
                format: .number
            )
            
            Text("Porte")
            // segmented control
            Picker("Porte", selection: $dogSize) {
                ForEach(Size.allCases, id: \.self){ size in
                    Text("\(size.rawValue.capitalized)")
                        .tag(size)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
                .background(.indigo)
            
            Spacer()
            
            if let result {
                Text("Seu Cachorro tem, em idade canina...")
                Text("\(result) anos")
                    .font(.display)
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .shadow(radius: 20)
            }
            
            Spacer()
            
            Button(action: calculateAge, label: {
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
    
    func calculateAge(){
        guard let years, let months else{
            print("preencha os campo de entrada")
            return
        }
        guard years > 0 || months > 0 else{
            print("algum campo tem que ter valor maior que zero")
            return
        }
        
        result = dogSize.convertAge(years: years, months: months)
    }
}

#Preview {
    ContentView()
}
