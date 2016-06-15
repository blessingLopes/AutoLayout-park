//
//  TableViewController.swift
//  TableViewController
//
//  Created by Manuel Lopes on 05/04/16.
//  Copyright © 2016 Manuel Lopes. All rights reserved.
//


import UIKit



class TableViewContoller: UITableViewController {
    
    // used to track changes in the user's text size accessibility setting
    var fontChangeObserver: AnyObject?
    
    
    // Array to use as data source for the tableView
    let dataSource : [String] = ["This life, which had been the tomb of his virtue and of his honor, is but a walking shadow; a poor player, that struts and frets his hour upon the stage, and then is heard no more: it is a tale told by an idiot, full of sound and fury, signifying nothing.",
        "is simply dummy text.",
        "upon dummy text ever since the 1500s, when an unknown printer.",
        "A time  years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classica.",
        "It is a long established fact that a reader will be distracted by the readableshe.",
        "Broken use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will u.",
        "Heart use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will u." ,
        "Years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classicaanother.",
        "Love dummy text ever since the 1500s, when an unknown printer.",
        " Suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined.",
                                 "to that struts and frets his hour up that struts and frets his hour up that struts and frets his hour up that struts and frets his hour up that's it!",
                                 "end."
]
    
    
    //MARK:- Initializers
    init(){
        super.init(nibName: nil, bundle: nil)
        setupTableView()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTableView()
    }
    
    
    //MARK:- De-initializer
    deinit {  }

    
    
    //MARK:- tableview dataSource Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView( _ tableView: UITableView,	numberOfRowsInSection section: Int) -> Int{
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        // please register BEFORE it's  dequeued
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else{ fatalError("Unable to dequeue a SelfSizingTableViewCell.") }
        
//        cell.accessoryType = .DisclosureIndicator

        // provide the string from the data source
        cell.body.text = dataSource[(indexPath as NSIndexPath).item]
        cell.name.text = "Cell title n. \((indexPath as NSIndexPath).item)"
        cell.time.text = "\((indexPath as NSIndexPath).item) m"
        cell.avatar.image = UIImage(named: "\((indexPath as NSIndexPath).item)")
        cell.isUserInteractionEnabled = false
        return cell
        
    }
    


    
    private func setupTableView(){
        //register the table view cell class
        tableView.register( TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        
        // set up data source and delegate
        tableView.dataSource = self
        tableView.delegate = self

        
        // Enable self sizing rows.
        tableView.estimatedRowHeight = 70.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //Table view config
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white()
        
        // make the separator line be full width of cell in Landscape modee
        tableView.cellLayoutMarginsFollowReadableWidth = false
     

        
    }
    
    
    
    
    
}// END

