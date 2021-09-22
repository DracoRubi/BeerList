//
//  BeerEntity.swift
//  BeerList
//
//  Created by Roberto Herranz on 21/9/21.
//

import Foundation

struct BeerEntity: Codable {
    var id: Int?
    var name: String?
    var tagline: String?
    var first_brewed: String?
    var description: String?
    var image_url: String?
    var abv: Double?
    var ibu: Double?
    var target_fg: Double?
    var target_og: Double?
    var ebc: Double?
    var srm: Double?
    var ph: Double?
    var attenuation_level: Double?
    var volume: BeerUnitValues?
    var boil_volume: BeerUnitValues?
    var method: BeerMethod?
    var ingredients: BeerIngredients?
    var food_pairing: [String]?
    var brewers_tips: String?
    var contributed_by: String?
}

struct BeerUnitValues: Codable {
    var value: Double?
    var unit: String?
}

struct BeerMethod: Codable {
    var mash_temp: [BeerMashTemp]?
}

struct BeerMashTemp: Codable {
    var temp: BeerUnitValues?
    var duration: Double?
}

struct BeerFermentation: Codable {
    var temp: BeerUnitValues
    var twist: String?
}

struct BeerIngredients: Codable {
    var malt: [BeerMalt]?
    var hops: [BeerHops]?
    var yeast: String?
}

struct BeerMalt: Codable {
    var name: String?
    var amount: BeerUnitValues?
}

struct BeerHops: Codable {
    var name: String?
    var amount: BeerUnitValues?
    var add: String?
    var attribute: String?
}
