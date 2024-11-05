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

struct HourlyForecastView: View{
    
    let hour: String
    let temperature: String
    let iconName: String
    
    var body: some View {
        VStack{
            Text(hour)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color.white)
            Image(iconName)
                .resizable()
                .frame(width: 30, height: 30)
            Text(temperature)
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

struct DailyForecastView: View{
    let weather: WeatherDay
    
    var body: some View {
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
        Divider().overlay(Color.white)
    }
}

struct ContentView: View {
    
    let weatherNow = "25ºC"
    let city = "Belo Horizonte"
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            LazyVStack(spacing: 20) {
                Text(city)
                    .font(.system(size: 20))
                    .foregroundStyle(Color(.blue))
                LazyHStack(spacing: 20) {
                    Text(weatherNow)
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
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 600, trailing: 0))
            
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
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .frame(width:200, height: 80)
                    .opacity(0.5)
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 340, trailing: 0))
            
            LazyVStack(){
                Text("PREVISÃO POR HORA")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 16, weight: .bold))
                ScrollView(.horizontal){
                    HStack(spacing: 10){
                        ForEach(mockData) { _ in
                            HourlyForecastView(hour: "13:00", temperature: "25ºC", iconName: "sunIcon")
                        }
                    }
                }
                .padding(.bottom, 80)
                
            }
            .padding()
            
            LazyVStack{
                Text("PROXIMOS DIAS")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 16, weight: .bold))
                
                ScrollView{
                    ForEach(mockData) { weather in
                        DailyForecastView(weather: weather)
                    }
                }
                .frame(height: 300)
                
            }
            .frame(width: 322)
            .padding(EdgeInsets(top: 400, leading: 0, bottom: 0, trailing: 0))
            
        }
        
        
    }
}


#Preview {
    ContentView()
}
