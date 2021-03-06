//
//  BeerListInteractor.swift
//  BeerList
//
//  Created by Roberto Herranz on 21/9/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class BeerListInteractor {
    let datasource = DataSource()
}

// MARK: - Extensions -

extension BeerListInteractor: BeerListInteractorInterface {
    
    func getBeers(success: @escaping ([BeerEntity]) -> (), failure: @escaping (Error) -> ()) {
        datasource.getAllBeers(success: success, failure: failure)
    }

    func getBeers(withParameters parameters: [String : String], success: @escaping ([BeerEntity]) -> (), failure: @escaping (Error) -> ()) {
        datasource.getBeersWithParameters(parameters: parameters, success: success, failure: failure)
    }
}
