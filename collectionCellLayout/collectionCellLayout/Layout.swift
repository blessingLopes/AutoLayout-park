//
//  Layout.swift
//  CollectionCellLayout
//
//  Created by manuel on 10/05/16.
//
//

import UIKit


class Layout: UICollectionViewLayout {
	
	
	// MARK:- Stored Properties
    var earlierAttributesInfo : [IndexPath : UICollectionViewLayoutAttributes ]  = [:]
    var attributesInfo        : [IndexPath : UICollectionViewLayoutAttributes ]  = [:]

    
    var contentSize : CGSize = CGSize.zero
    var tappedCellIndexPath: IndexPath? 
    
 
    // Prepare the  Layout
	override func prepare() {
        
        prepareCells()
	}
	
	
	


    override var collectionViewContentSize: CGSize { return  contentSize	}
	
	
    // It's  more efficient to pick out only the cells which intersect the rect,
    // then simply returning an array with all the attributes.
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes: [UICollectionViewLayoutAttributes] = []

        for ( _ , v) in attributesInfo  where rect.intersects(v.frame){ attributes.append(v) }
        
        return attributes
    }
    
	
	override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
		return attributesInfo[indexPath]
	}
	
	
	
	
	override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
	}

    
	
	// MARK:- UICollectionViewLayout subClass Optional Methods from here on down
    // MARK:-  Cell Layout Attributes
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return earlierAttributesInfo[itemIndexPath]
    }
    
   
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutAttributesForItem(at: itemIndexPath)
    }
    
  
	

	
    // adjust collectionView contentOfset when the cell tapped animates out of the screen visible rect
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        guard let tappedIndex = tappedCellIndexPath else { return proposedContentOffset }
        
        var finalContentOffset : CGPoint?
        if let frame = layoutAttributesForItem(at: tappedIndex)?.frame {
            let collectionViewHeight = collectionView?.bounds.size.height ?? 0
            
            let collectionViewTop = proposedContentOffset.y
            let collectionViewBottom = collectionViewTop + collectionViewHeight
            
            let cellTop = frame.origin.y
            let cellBottom = cellTop + frame.size.height
            let deltaCellExpansion = LayoutSetupValues.animationStretch - LayoutSetupValues.cellSize.height
            
            
            if cellBottom < collectionViewTop || cellTop - deltaCellExpansion > collectionViewBottom{
                finalContentOffset = proposedContentOffset
            }else if cellBottom > collectionViewBottom {
                finalContentOffset = CGPoint(x: 0.0, y: collectionViewTop + (cellBottom - collectionViewBottom))
            } else if cellTop < collectionViewTop {
                finalContentOffset = CGPoint(x: 0.0, y: collectionViewTop - (collectionViewTop - cellTop) )
            }
        }
        
        return finalContentOffset ?? proposedContentOffset
    }
    
    



//MARK:- Private convenience Methods - Prepare layout
    
    private func prepareCells(){
        guard let collectionView = collectionView else { return }
        
        let cellsize   = LayoutSetupValues.cellSize
        let numberOfsections = collectionView.numberOfSections
        let itemCount  = collectionView.numberOfItems(inSection: 0)

        earlierAttributesInfo = attributesInfo
        
        var zindex: Int = 0
        var yindex: CGFloat = 0

        // generate the an attributes dictionary
        for section in 0 ..< numberOfsections{
          
            for  i in 0 ..< itemCount{
                
                let indexPath = IndexPath(item: i, section: section)
                let attributes  = UICollectionViewLayoutAttributes(forCellWith: indexPath)
               
                let newSize = CGSize(
                    width:  cellsize.width,
                    height: indexPath == tappedCellIndexPath ? LayoutSetupValues.animationStretch : cellsize.height
                )
           
                attributes.frame =  CGRect(x: 0, y: yindex, width: cellsize.width, height: newSize.height)
                attributes.alpha = 1.0
                zindex -= 1
                attributes.zIndex = zindex
                attributesInfo[indexPath] = attributes
                
                yindex += newSize.height
            }
        }
        contentSize = CGSize(width: 0.0, height: yindex )
    }
	
  
	
}//End
