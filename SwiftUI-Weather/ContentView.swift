//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by dev on 4/28/23.
//

import SwiftUI

struct ContentView: View {
 
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Manila, PH")
                
                MainWeatherStatusView(
                    temperature: 28,
                    imageName: isNight ? "cloud.moon.fill" : "cloud.sun.rain.fill"
                )
                
                HStack(spacing: 20) {
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "sun.max.fill",
                        temperature: 28
                    )
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "cloud.bolt.rain.fill",
                        temperature: 27
                    )
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "moon.stars.fill",
                        temperature: 30
                    )
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "wind",
                        temperature: 32
                    )
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "cloud.sun.fill",
                        temperature: 25
                    )
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        title: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white
                    )
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(Color.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray :  Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(Color.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var temperature: Int
    var imageName: String
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

