//
//  GlobalManager.swift
//  ProjectCursoMaestro
//
//  Created by Genaro Martinez on 19/11/23.
//

import Foundation

class GlobalManager {
    static let shared = GlobalManager()

    private init() {}

    var jwtToken: String?

    class func setJWTToken(_ token: String) {
        shared.jwtToken = token
    }
}
