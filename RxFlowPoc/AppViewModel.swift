//
//  DashboardViewModel.swift
//  RxFlowPoc
//
//  Created by Devesh Kumar on 12/03/19.
//  Copyright © 2019 Devesh Kumar. All rights reserved.
//

import Foundation
import RxFlow
import RxCocoa

class AppViewModel : Stepper{
    
    var steps =  PublishRelay<Step>()
    
    init() {
        self.steps.accept(AppSteps.intro)
    }
    
    public func toIntro() {
        self.steps.accept(AppSteps.intro)
    }
    
    func toDetailPage() {
        self.steps.accept(AppSteps.details)
    }
    
    func toSetupFlow() {
        self.steps.accept(AppSteps.setupFlow)
    }
    
    func toFinishPage() {
        self.steps.accept(AppSteps.finish)
    }
}
