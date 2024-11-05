//
//  ContentView.swift
//  App_Swiftui
//
//  Created by Thais Souza on 25/10/24.
//

import SwiftUI
struct WeatherDay: Identifiable{
    let id = UUID()
    let day: String
    let icon: String
    let minTemp: String
    let maxTemp: String
}

let background = Image("background")
let rows = [GridItem(.fixed(30))]
let mockData = [
    WeatherDay(day: "TER", icon: "cloud.rain.fill", minTemp: "min 20", maxTemp: "max 29"),
    WeatherDay(day: "TER", icon: "cloud.rain.fill", minTemp: "min 20", maxTemp: "max 29"),
    WeatherDay(day: "TER", icon: "cloud.rain.fill", minTemp: "min 20", maxTemp: "max 29"),
    WeatherDay(day: "TER", icon: "cloud.rain.fill", minTemp: "min 20", maxTemp: "max 29"),
    WeatherDay(day: "TER", icon: "cloud.rain.fill", minTemp: "min 20", maxTemp: "max 29"),
    WeatherDay(day: "TER", icon: "cloud.rain.fill", minTemp: "min 20", maxTemp: "max 29"),
    WeatherDay(day: "TER", icon: "cloud.rain.fill", minTemp: "min 20", maxTemp: "max 29")
]

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            LazyVStack(spacing: 20) {
                Text("Belo Horizonte")
                    .font(.system(size: 20))
                    .foregroundStyle(Color(.blue))
                LazyHStack(spacing: 20) {
                    Text("25ºC")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundStyle(Color.blue)
                    Image("sunIcon")
                }
            }
            .background{
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
                    .frame(width: 280, height: 150)
            }
            .position(CGPoint(x: 180.0, y: 150.0))
            .padding()
            
            LazyVStack(spacing: 10, content: {
                LazyHStack(spacing: 30, content: {
                    Text("Velocidade")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color.white)
                    
                    Text("10km/h")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color.white)
                    
                })
                LazyHStack(spacing: 30, content: {
                    Text("Umidade")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color.white)
                    Text("03mm")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color.white)
                    
                })
            })
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .frame(width:200, height: 80)
                    .opacity(0.5)
            }
            .position(CGPoint(x: 180.0, y: 300.0))
            .padding()
            
            LazyVStack(){
                Text("PREVISÃO POR HORA")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 16, weight: .bold))
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                ScrollView(.horizontal){
                    LazyHGrid(rows: rows, spacing: 10){
                        ForEach(0..<8){_ in
                            VStack{
                                Text("13:00")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundStyle(Color.white)
                                Image("sunIcon")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("25ºC")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(Color.white)
                            }
                            .frame(width: 70, height: 90)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(.white, lineWidth: 1)
                                    .opacity(0.6))
                        }
                    }
                }
                .padding(.bottom, 50)
                
            }
            
            LazyVStack{
                Text("PROXIMOS DIAS")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 16, weight: .bold))
                    .padding(EdgeInsets(top: 60, leading: 0, bottom: 10, trailing: 0))
                
                ScrollView(.vertical){
                    ForEach(mockData) { weather in
                        HStack{
                            Text(weather.day)
                                .frame(width: 50, alignment: .leading)
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Image(systemName: weather.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                            Spacer()
                            Text(weather.minTemp)
                                .font(.subheadline)
                                .foregroundStyle(Color.white)
                            
                            Spacer()
                            Text(weather.maxTemp)
                                .font(.subheadline)
                                .foregroundStyle(Color.white)
                        }
                        .padding(.horizontal)
                        .frame(height: 40)
                        
                        Divider()
                            .overlay(Color.white)
                    }
                }
                                
            }
            .frame(width: 322, height: 400)
            .padding(EdgeInsets(top: 500, leading: 0, bottom: 0, trailing: 0))
        }
        
    }
}


#Preview {
    ContentView()
}
