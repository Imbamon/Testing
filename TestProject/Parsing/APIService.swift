//
//  APIService.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 17/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import Foundation

class APIService{
    
private let url = "https://jsonplaceholder.typicode.com"

func getRequest(path:String,completion: @escaping (([Any]?,String?) -> Void)){
    
    if path == "/posts"{
        guard let finalUrl = URL(string: url + path) else {return}
        
        URLSession.shared.dataTask(with: finalUrl) { (data, response, error) in
            if let error = error{
                DispatchQueue.main.async {
                    completion(nil, error.localizedDescription)
                    return
                }
            }
            
            guard let data = data else {return}
            
            do{
                let elements = try JSONDecoder().decode([Element].self,from: data)
                completion(elements, nil)
            }
            catch{
                return completion(nil, "Ошибка, данные не получены")
            }
            
            }.resume()
        
    }else if path == "/comments"{
        
        guard let finalUrl = URL(string: url + path) else {return}
        
        URLSession.shared.dataTask(with: finalUrl) { (data, response, error) in
            if let error = error{
                DispatchQueue.main.async {
                    completion(nil, error.localizedDescription)
                    return
                }
            }
            
            guard let data = data else {return}
            
            do{
                let comments = try JSONDecoder().decode([Comment].self,from: data)
                completion(comments, nil)
            }
            catch{
                return completion(nil, "Ошибка, данные не получены")
            }
            
            }.resume()
        
}
}

}
