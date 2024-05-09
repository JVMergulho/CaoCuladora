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
    @State var porte: String = "Pequeno"
    
    let portes = ["Pequeno", "Médio", "Grande"]
    
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
            Picker("Porte", selection: $porte) {
                ForEach(portes, id: \.self){ porte in
                    Text("\(porte)")
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
                .background(.indigo)
            
            Spacer()
            
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
        
        result = years * 7 + (months*7)/12
    }
}

#Preview {
    ContentView()
}
