//
//  ViewController.swift
//  ItunesSearchTests
//
//  Created by Ildar Zalyalov on 05.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    let contentCellIdentifier = "contentCellIdentefier"
    let contentNibName =  "ContentTableViewCell"
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    func registerCell() {
        let nib = UINib(nibName: contentNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: contentCellIdentifier)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contentCellIdentifier, for: indexPath) as! ContentTableViewCell
        
        return cell
        
    }


}

