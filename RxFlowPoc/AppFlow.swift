//
//  AppFlow.swift
//  RxFlowPoc
//
//  Created by Devesh Kumar on 12/03/19.
//  Copyright © 2019 Devesh Kumar. All rights reserved.
//

import Foundation
import UIKit
import  RxFlow


class AppFlow: Flow {
    var root: Presentable {
          return self.rootViewController
    }
    private let viewModel: AppViewModel

    init( with stepper:AppViewModel) {
        viewModel = stepper
    }
    
    private lazy var rootViewController: UINavigationController = {
        let vc = UINavigationController()
        vc.setNavigationBarHidden(false, animated: true)
        return vc
    }()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppSteps else {return .none}
        switch step {
        case .intro:
            return navigateToIntro()
        case .details:
             return navigateToDetail()
        case .setupFlow:
            return navigateToSetUpFlow()
        case .finish:
            return navigateToFinish()
        }
        
    }
    
    func navigateToIntro() -> FlowContributors {
       
        let viewController =  UIStoryboard.storyboard(.main).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
       viewController.appViewModel = viewModel
        rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor:FlowContributor.contribute(withNextPresentable: viewController, withNextStepper: viewModel))
    }
    
    func navigateToDetail() -> FlowContributors {
        let viewController =  UIStoryboard.storyboard(.Detail).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        viewController.appViewModel = viewModel
        rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: FlowContributor.contribute(withNextPresentable: viewController, withNextStepper: viewModel))
        
    }
    
    func navigateToSetUpFlow() -> FlowContributors {
        return .none
    }
    
    func navigateToFinish() -> FlowContributors {
        return .none
    }
}
