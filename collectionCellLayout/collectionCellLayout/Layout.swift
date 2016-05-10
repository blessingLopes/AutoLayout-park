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
    var earlierAttributesInfo : [NSIndexPath : UICollectionViewLayoutAttributes ]  = [:]
    var attributesInfo        : [NSIndexPath : UICollectionViewLayoutAttributes ]  = [:]

    
    var contentSize : CGSize = CGSizeZero
    var tappedCellIndexPath: NSIndexPath? 
    
 
    // Prepare the  Layout
	override func prepareLayout() {
        
        prepareCells()
	}
	
	
	


	override func collectionViewContentSize() -> CGSize {
		return  contentSize
	}
	
	
	
	
    // It's  more efficient to pick out only the cells which intersect the rect,
    // then simply returning an array with all the attributes.
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes: [UICollectionViewLayoutAttributes] = []

        for ( _ , v) in attributesInfo  where CGRectIntersectsRect(rect, v.frame){ attributes.append(v) }
        
        return attributes
    }
    
	
	override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
		return attributesInfo[indexPath]
	}
	
	
	
	
	override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
	}

    
	
	// MARK:- UICollectionViewLayout subClass Optional Methods from here on down
    // MARK:-  Cell Layout Attributes
    
    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return earlierAttributesInfo[itemIndexPath]
    }
    
   
    
    override func finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutAttributesForItemAtIndexPath(itemIndexPath)
    }
    
  
	

	
    // adjust collectionView contentOfset when the cell tapped animates out of the screen visible rect
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint) -> CGPoint {
        guard let tappedIndex = tappedCellIndexPath else { return proposedContentOffset }
        
        var finalContentOffset : CGPoint?
        if let frame = layoutAttributesForItemAtIndexPath(tappedIndex)?.frame {
            let collectionViewHeight = collectionView?.bounds.size.height ?? 0
            
            let collectionViewTop = proposedContentOffset.y
            let collectionViewBottom = collectionViewTop + collectionViewHeight
            
            let cellTop = frame.origin.y
            let cellBottom = cellTop + frame.size.height
            let deltaCellExpansion = LayoutSetupValues.animationStretch - LayoutSetupValues.cellSize.height
            
            
            if cellBottom < collectionViewTop || cellTop - deltaCellExpansion > collectionViewBottom{
                finalContentOffset = proposedContentOffset
            }else if cellBottom > collectionViewBottom {
                finalContentOffset = CGPointMake(0.0, collectionViewTop + (cellBottom - collectionViewBottom))
            } else if cellTop < collectionViewTop {
                finalContentOffset = CGPointMake(0.0, collectionViewTop - (collectionViewTop - cellTop) )
            }
        }
        
        return finalContentOffset ?? proposedContentOffset
    }
    
    



//MARK:- Private convenience Methods - Prepare layout
    
    private func prepareCells(){
        guard let collectionView = collectionView else { return }
        
        let cellsize   = LayoutSetupValues.cellSize
        let numberOfsections = collectionView.numberOfSections()
        let itemCount  = collectionView.numberOfItemsInSection(0)

        earlierAttributesInfo = attributesInfo
        
        var zindex: Int = 0
        var yindex: CGFloat = 0

        // generate the an attributes dictionary
        for section in 0 ..< numberOfsections{
          
            for  i in 0 ..< itemCount{
                
                let indexPath = NSIndexPath(forItem: i, inSection: section)
                let attributes  = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
               
                let newSize = CGSize(
                    width:  cellsize.width,
                    height: indexPath == tappedCellIndexPath ? LayoutSetupValues.animationStretch : cellsize.height
                )
           
                attributes.frame =  CGRectMake(0, yindex, cellsize.width, newSize.height)
                attributes.alpha = 1.0
                zindex -= 1
                attributes.zIndex = zindex
                attributesInfo[indexPath] = attributes
                
                yindex += newSize.height
            }
        }
        contentSize = CGSizeMake(0.0, yindex )
    }
	
  
	
}//End
