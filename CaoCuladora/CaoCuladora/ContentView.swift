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
    @State var failedInput: Bool = false
    @State var negativeInput: Bool = false
    
    let alertMsg = "Preencha todos os campos antes de cãocular"
    let negativeMsg = "A idade deve ser positiva"
                    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading) {
                    Text("Qual a idade do seu cachorro?")
                        .font(.header5)
                        .padding(.top, 24)
                        .padding(.bottom, 12)
                    
                    VStack(alignment: .leading, spacing: 8.0){
                        Text("Anos")
                            .font(.body1)
                        TextField(
                            "Quantos anos completos seu cão tem?",
                            value: $years,
                            format: .number
                        )
                    }
                    .padding(.bottom, 12)
                    
                    VStack(alignment: .leading, spacing: 8.0){
                        Text("Meses")
                            .font(.body1)
                        TextField(
                            "E quantos meses além disso ele tem?",
                            value: $months,
                            format: .number
                        )
                    }
                    .padding(.bottom, 12)
                    
                    VStack(alignment: .leading, spacing: 8.0){
                        Text("Porte")
                            .font(.body1)
                        // segmented control
                        Picker("Porte", selection: $dogSize) {
                            ForEach(Size.allCases, id: \.self){ size in
                                Text("\(size.rawValue.capitalized)")
                                    .tag(size)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding(.bottom, 12)
                    
                    Divider()
                        .background(.myIndigo)
                    
                    Spacer()
                    
                    if let result {
                        Text("Seu Cachorro tem, em idade canina...")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        Text("\(result) anos")
                            .font(.display)
                            .foregroundColor(.myIndigo)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding(12)
                            .contentTransition(.numericText())
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
                            Color.myIndigo
                            Text("CãoCular")
                                .foregroundStyle(.white)
                                .bold()
                        }
                    })
                    .cornerRadius(10)
                    .frame(height: 50)
                    .padding(.bottom, 24)
                }
                .alert(alertMsg, isPresented: $failedInput){
                    Button("OK", role: .cancel, action: {})
                }
                .alert(negativeMsg, isPresented: $negativeInput){
                    Button("OK", role: .cancel, action: {})
                }
                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .fontDesign(.rounded)
                .padding()
                .navigationTitle("CãoCuladora")
                .toolbarBackground(
                    .visible,
                    for: .navigationBar)
                .toolbarBackground(
                    .myIndigo,
                    for: .navigationBar)
                .toolbarColorScheme(
                    .dark,
                for: .navigationBar)
                .scrollDismissesKeyboard(.immediately)
            }
        }
    }
    
    func calculateAge(){
        guard let years, let months else{
            print("preencha os campos de entrada")
            self.failedInput = true
            return
        }
        guard years > 0 && months > 0 else{
            print("algum campo tem que ter valor maior que zero")
            self.negativeInput = true
            return
        }
        
        withAnimation(.easeIn.speed(0.5)){
            result = dogSize.convertAge(
                years: years,
                months: months)
        }
    }
}

#Preview {
    ContentView()
}
