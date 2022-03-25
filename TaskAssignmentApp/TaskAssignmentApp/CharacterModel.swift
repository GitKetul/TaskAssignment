//
//  CharacterModel.swift
//  TaskAssignmentApp
//
//  Created by Mac-003 on 25/03/22.
//

import Foundation

struct CharacterModel: Codable {
    
//    var userId: Int
//    var id: Int
//    var title: String
//    var body: String
    
    var id: Int
    var firstName: String
    var lastName: String
    var fullName: String
    var title: String
    var family: String
    var image: String
    var imageUrl: String
}


extension CharacterModel {
    
    enum PostModelCodingKeys: String, CodingKey {
        
        case id
        case firstName
        case lastName
        case fullName
        case title
        case family
        case image
        case imageUrl
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: PostModelCodingKeys.self)
                
        id = try container.decode(Int.self, forKey: .id)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        fullName = try container.decode(String.self, forKey: .fullName)
        title = try container.decode(String.self, forKey: .title)
        family = try container.decode(String.self, forKey: .family)
        image = try container.decode(String.self, forKey: .image)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)

    }
}
