//
//  LayoutSetupValues.swift
//  CollectionCellLayout
//
//  Created by manuel on 10/05/16.
//
//

import UIKit



struct LayoutSetupValues {
	
	
    private  static var cellWidth : CGFloat {
        let width = LayoutSetupValues.scr.width
        return width
    }
    
    
   static var scr : CGRect { return UIScreen.mainScreen().bounds }
   static var scrSize : CGSize { return UIScreen.mainScreen().bounds.size }
	

    
    // amount the cell will animate
   static let animationStretch : CGFloat = 300
    
	
	// The Cell Size
   static var cellSize : CGSize { return CGSizeMake(LayoutSetupValues.cellWidth, 70)  }
	
	
}








