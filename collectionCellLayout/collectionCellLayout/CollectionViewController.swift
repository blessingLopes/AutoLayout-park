//
//  ViewController.swift
//  CollectionCellLayout
//
//  Created by manuel on 10/05/16.
//
//
import UIKit

class CollectionViewController: UICollectionViewController{
    
    // MARK: Properties
    private var fontChangeObserver: AnyObject?
    private let mydataSource : CollectionViewDataSource = CollectionViewDataSource()

    private var status: Bool = false
    
    private var theLayout : Layout?
    
    //MARK:- Initialzers
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
       setupCollectionViewWithDataSource( mydataSource)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupCollectionViewWithDataSource( mydataSource)
    }
    


    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareFontChangeObserver()
        
    }
    
    
 
    
    // MARK:- collection view Delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        animateCellAt(index: indexPath)
      
    }

    
    
    //MARK:- ScrollView Delegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > -10 {  toogleStatus(true) }
        else { toogleStatus(false) }
    }
    
    
  
    
    //MARK:- Private convenience Methods
    
    
    private func toogleStatus( _ on: Bool){
        UIView.animate(withDuration: 0.5, animations: {
            self.status = on
            self.setNeedsStatusBarAppearanceUpdate()
        })
    }
    
    
    
    private func setupCollectionViewWithDataSource(_ data: UICollectionViewDataSource){
        
        theLayout = collectionViewLayout as? Layout
        collectionView?.dataSource = data
        collectionView?.delegate   = self
        collectionView?.register(Cell.self, forCellWithReuseIdentifier: Cell.cellreuseIdentifier)
        let collectionInsets = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        collectionView?.contentInset = collectionInsets
 
    }
    
    // setup dynamic type obsever
    private func prepareFontChangeObserver(){
        
        let application = UIApplication.shared
        let notificationCenter = NotificationCenter.default
        let queue = OperationQueue.main
        
        fontChangeObserver = notificationCenter.addObserver(forName: NSNotification.Name.UIContentSizeCategoryDidChange, object: application, queue: queue) {
            // [unowned self] to prevent a block from holding a strong reference to self
            [unowned self] _ in
            
            // In the cell's prepareForReuse() override, the text is updated to the user prefered size,
            // but not all cells are subject to that call. Reloading the collectionView when the app is
            // notified that the user changed the prefered front size makes sure all cells get updated.
            self.collectionView?.reloadData()
     
        }
    }
    

    // animate collection view cell
    private func animateCellAt(index indexPath: IndexPath){
       
            theLayout?.tappedCellIndexPath = theLayout?.tappedCellIndexPath == indexPath ? nil : indexPath
        
        
            UIView.animate(
                withDuration: 0.5,
                delay: 0.0,
                usingSpringWithDamping:  0.7,
                initialSpringVelocity: 4,
                options: [],
                animations: {
                    self.theLayout?.invalidateLayout()    // recalculate the layout
                    self.collectionView?.layoutIfNeeded() // needed to inforce the spring animation
                },
                completion: nil
            )
        }
    
    
    //MARK:- Status bar
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent  }
    override var prefersStatusBarHidden: Bool {  return status  }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { return .slide  }
    
    
    
    
    
    
    

}//ENd

    
    

    







