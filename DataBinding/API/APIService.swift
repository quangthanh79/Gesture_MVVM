//
//  APIService.swift
//  DataBinding
//
//  Created by Tuấn Phạm on 18/03/2022.
//
import UIKit

class APIService: NSObject {
    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
    func apiToGetUser(complete : @escaping(Data?,URLResponse?,Error?)-> (Void)){
        var uRLSessionDataTask = URLSession.shared.dataTask(with: url, completionHandler: complete)
        uRLSessionDataTask.resume()
    }

}
