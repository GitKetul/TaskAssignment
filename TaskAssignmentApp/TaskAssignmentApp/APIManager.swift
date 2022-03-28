//
//  APIManager.swift
//  TaskAssignmentApp
//
//  Created by Mac-003 on 25/03/22.
//

import Foundation
import Moya

enum APIManager {
    
    case characters
    case charactersDetails(charId:String)
    
}

extension APIManager: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://thronesapi.com/api/v2")!
    }
    
    var path: String {
        
        switch self {
        case .characters:
            return "/Characters"
        case .charactersDetails(let charId):
            return "/Characters/\(charId)"
            
        }
    }
    
    var method: Moya.Method {
        
        switch self {
        case .characters:
            return .get
        case .charactersDetails:
            return .get
            
            
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .characters:
            return .requestPlain
        case .charactersDetails:
            return .requestPlain
            
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

struct NetworkManager {
    
    static var provider = MoyaProvider<APIManager>()
    
    static func getList(completion: @escaping (([CharacterModel]) -> Void)) {
        
        provider.request(.characters) { (result) in
            
            switch result {
            case .success(let response):
                
                do {
                    let dataResponse = try JSONDecoder().decode([CharacterModel].self, from: response.data)
                    completion(dataResponse)
                } catch {
                    print("")
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func getCharacter(charId :String, completion: @escaping ((CharacterModel) -> Void)) {
        
        provider.request(.charactersDetails(charId: charId)) { (result) in
            
            switch result {
            case .success(let response):
                
                do {
                    let dataResponse = try JSONDecoder().decode(CharacterModel.self, from: response.data)
                    completion(dataResponse)
                } catch {
                    print("")
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
