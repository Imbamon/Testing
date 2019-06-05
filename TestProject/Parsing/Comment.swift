//
//  Comment.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 17/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import Foundation

struct Comment:Decodable{
    var postId:Int?
    var id:Int?
    var name:String?
    var email:String?
    var body:String?
}
