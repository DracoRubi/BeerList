//
//  BeerListPresenter.swift
//  BeerList
//
//  Created by Roberto Herranz on 21/9/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class BeerListPresenter {

    // MARK: - Private properties -

    private unowned let view: BeerListViewInterface
    private let interactor: BeerListInteractorInterface
    private let wireframe: BeerListWireframeInterface
    private var isAlreadyRequestingData: Bool = false
    private var currentPage: Int = 1
    private var currentSearch: String = ""
    private var endHasBeenReached: Bool = false

    // MARK: - Lifecycle -

    init(
        view: BeerListViewInterface,
        interactor: BeerListInteractorInterface,
        wireframe: BeerListWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    private func getBeers() {
        isAlreadyRequestingData = true
        var parameters = [BeerQueryParameters.page: String(currentPage)]
        if !currentSearch.isEmpty { parameters[BeerQueryParameters.name] = currentSearch }
        
        interactor.getBeers(withParameters: parameters, success: { [weak self] beerList in
            print("BEACON: Result with number of beers: \(beerList.count)")
            if beerList.isEmpty {
                self?.endHasBeenReached = true
            } else {
                if self?.currentPage == 1 {
                    self?.view.initializeBeerData(withData: beerList)
                } else {
                    self?.view.appendBeerData(withData: beerList)
                }
                self?.currentPage += 1
            }
            self?.isAlreadyRequestingData = false
        }, failure: { [weak self] error in
            self?.handleError(error: error)
        })
    }

    private func handleError(error: Error) {
        print("There was an error getting the beers! \n \(error)")
    }
}

// MARK: - Extensions -

extension BeerListPresenter: BeerListPresenterInterface {
    
    func onViewDidAppear() {
        getBeers()
    }

    func onSearchTextUpdated(text: String) {
        currentPage = 1
        currentSearch = text
        endHasBeenReached = false
        getBeers()
    }

    func rowSelectedWithData(data: BeerEntity) {
        wireframe.presentBeerDetailWithData(data: data)
    }

    func onTableViewNearingEnd() {
        if !isAlreadyRequestingData && !endHasBeenReached {
            view.animateActivityIndicator()
            getBeers()
        }
    }
}
