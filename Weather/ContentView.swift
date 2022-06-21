//
//  ContentView.swift

//  Weather
//
//  Created by Ato Sam on 6/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Night = false
    
    var body: some View {
        ZStack{
            BackgroundView(topColor: Night ?.black : .blue, bottomColor: Night ?.gray: Color ("lightblue"))
            
            VStack(alignment: .center, spacing: 0.0){
                City(CityName: "Kumasi")
            
                ChangeDaytime(day: Night ? "moon.stars.fill" : "cloud.sun.fill", temperature: 30)
                
                HStack (spacing: 15){
                    WeatherDay(DayofWeek: "TUE", ImageName: "cloud.sun.fill", temperature: 27)
                    WeatherDay(DayofWeek: "WED", ImageName: "smoke.fill", temperature: 22)
                    WeatherDay(DayofWeek: "THUR", ImageName: "wind", temperature: 24)
                    WeatherDay(DayofWeek: "FRI", ImageName: "sun.max.fill", temperature: 33)
                    WeatherDay(DayofWeek: "SAT", ImageName: "snowflake", temperature: 18)
                    
                    
                }
              Spacer()
                
                Button{
                    Night.toggle()
                }
                
                label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
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

struct WeatherDay: View {
    
    var DayofWeek: String
    var ImageName: String
    var temperature: Int
    
    var body: some View {

        VStack (spacing: 3){
            Text(DayofWeek)
                .font(.system(size: 14, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            
            Text("\(temperature)°C")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct City: View {
    var CityName: String
    
    var body: some View {
        
        Text(CityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(10)
    }
}


struct ChangeDaytime: View {
    var day: String
    var temperature: Int
    
    var body: some View {
        
        VStack (spacing: -10){
        Image(systemName: day)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
        
        
        Text("\(temperature)°C")
    //option + shift + 8 - degree symbol
            .font(.system(size: 70, weight: .medium, design: .default))
            .foregroundColor(.white)
       
        }

    .padding(40)
        
    }
}

   
