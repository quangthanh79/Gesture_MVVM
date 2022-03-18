//
//  ObservableViewModelProtocol.swift
//  DataBinding
//
//  Created by Tuấn Phạm on 18/03/2022.
//
import Foundation


protocol ViewModelProtocol {
    func fetchUser()
    func setError(_ message: String)
    var userOb: Observable<User> { get  set } //1
    var errorMessage: Observable<String?> { get set }
    var error: Observable<Bool> { get set }
}
