//
//  DashboardViewController.swift
//  RxFlowPoc
//
//  Created by Devesh Kumar on 12/03/19.
//  Copyright © 2019 Devesh Kumar. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    var appViewModel:AppViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func  continueToDetailView(_ sender: UIButton) {
        appViewModel?.toDetailPage()
     }
    
}