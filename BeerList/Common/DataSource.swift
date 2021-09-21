//
//  DataSource.swift
//  BeerList (iOS)
//
//  Created by Roberto Herranz on 20/9/21.
//

import Foundation

class DataSource {

    let session = URLSession.shared
    var urlComponents = URLComponents(string: "https://api.punkapi.com/v2/beers")!

    public func getAllBeers(success: @escaping ([BeerEntity]) -> (), failure: @escaping (Error) -> ()) {

        sendBeerListRequest(success: success, failure: failure)
    }

    public func getBeersWithParameters(parameters: [String : String], success: @escaping ([BeerEntity]) -> (), failure: @escaping (Error) -> ()) {
        
        let queryItem = parameters.map { URLQueryItem(name: $0, value: $1) }
        sendBeerListRequest(withParameters: queryItem, success: success, failure: failure)
    }

    private func sendBeerListRequest(withParameters parameters: [URLQueryItem] = [], success: @escaping ([BeerEntity]) -> (), failure: @escaping (Error) -> ()) {
        
        urlComponents.queryItems = parameters
        if let url = urlComponents.url {
            let task = session.dataTask(with: url, completionHandler: { data, response, error in

                if let error = error {
                    failure(error)
                } else if let data = data {
                    do {
                        let beerList = try JSONDecoder().decode([BeerEntity].self, from: data)
                        success(beerList)
                    } catch {
                        failure(error)
                    }
                }
            })

            task.resume()
        } else {
            failure(CustomError.malformedURL)
        }
    }
}
