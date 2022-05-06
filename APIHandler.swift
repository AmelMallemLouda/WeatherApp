//
//  APIHandler.swift
//  WeatherApp
//
//  Created by Amel Mallem on 5/5/22.
//

import Foundation

// Mark: Singlton class
class APIHandler {
   
    static let shared = APIHandler()
     private init(){}
    
    
    // Mark : Passing data with protocol Delegate
    var delegate : APIHandlerProtocol?
  
    
    // Mark : API / request to get the data
    func GetDataFromIPAHandler(){
        let strURL = "https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&appid=0bdf513bdc9ef9d4213de34f46610fc0"
        guard let url = URL.init(string: strURL) else {return}
        
        URLSession.shared.dataTask(with: url){ data , response , error in
            
            self.delegate?.GetData(data: data, response: response, error: error)
        }.resume()
  
    }
    
    
}
// Mark : passing data using protocol delegate
protocol APIHandlerProtocol {
    func GetData( data : Data?, response : URLResponse?, error : Error?)
}
