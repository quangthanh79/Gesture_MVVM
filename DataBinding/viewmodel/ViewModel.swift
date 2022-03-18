//
//  ViewModel.swift
//  DataBinding
//
//  Created by Tuấn Phạm on 18/03/2022.
//

import UIKit

class ViewModel: NSObject,ViewModelProtocol {
    
    var userOb: Observable<User> = Observable(User(userId:1,id: 1,title:"",body:""))
    var apiService: APIService!
    var errorMessage: Observable<String?> = Observable(nil)
    var error: Observable<Bool> = Observable(false)
    func fetchUser() {
        self.apiService.apiToGetUser { (data: Data?,URLResponse: URLResponse?,error: Error?) in
                if let Data = data {
                    let jsonDecoder = JSONDecoder()
                    let dataResponse = try! jsonDecoder.decode(User.self, from: Data) as User
                    self.userOb = Observable(dataResponse)
                }
            
        }
    }

    func setError(_ message: String) {
    
    }

    override init(){
        super.init()
        self.apiService = APIService()
        fetchUser()

    }


}
