//
//  ContentView.swift
//  SwiftUI_TipCalculator
//
//  Created by michael on 23/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State var BillAmount = ""
    @State var tipAmount: Float = 0.0
    @State var totalAmount: Float = 0.0
    
    var body: some View {
        ZStack {
            Image("background_1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Tip Calculator")
                    .font(.largeTitle)
                
                Spacer()
                
                Label("Enter Bill Amount", systemImage: "")
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                
                
                
                
                TextField("enter Bill Amount", text: $BillAmount)
                    .padding()
                    .frame(height: 42)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.oneTimeCode)
                    .keyboardType(.numberPad)
                    .border(Color.gray, width: 2)
                    .cornerRadius(5.0)
                
                Spacer()
                
                
                Label("Select Tip Percentage", systemImage: "")
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding([.leading, .bottom])
                
                
                
                HStack(alignment:.firstTextBaseline){
                    Button("10%") {
                        calculateTip(percentage: 10)
                    }
                    .buttonStyle(BorderedButtonStyle())
                    .padding(.leading,29.0)
                    
                    Spacer()
                    
                    Button("15%") {
                        calculateTip(percentage: 15)
                    }
                    .buttonStyle(BorderedButtonStyle())
                    
                    Spacer()
                    
                    Button("20%") {
                        calculateTip(percentage: 20)
                    }
                    .padding(.trailing,29)
                    .buttonStyle(BorderedButtonStyle())
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                
                
                Spacer()
                
                
                Label("Tip Amount $\(tipAmount, specifier: "%.2f")", systemImage: "")
                
                Spacer()

                Label("Total Amount $\(totalAmount, specifier: "%.2f")", systemImage: "")

                
            }
            
        }
    }
    func calculateTip(percentage: Float){
        guard let bill = Float(BillAmount) else{return}
        tipAmount = bill * (percentage/100)
        totalAmount = bill + tipAmount
    }
}

#Preview {
    ContentView( )
}
