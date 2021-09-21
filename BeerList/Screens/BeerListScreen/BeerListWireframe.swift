//
//  BeerListWireframe.swift
//  BeerList
//
//  Created by Roberto Herranz on 21/9/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class BeerListWireframe: BaseWireframe<BeerListViewController> {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "BeerList", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: BeerListViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = BeerListInteractor()
        let presenter = BeerListPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension BeerListWireframe: BeerListWireframeInterface {
}