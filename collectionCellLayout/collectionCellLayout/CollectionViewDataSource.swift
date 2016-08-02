//
//  CollectionViewDataSource.swift
//  CollectionCellLayout
//
//  Created by manuel on 10/05/16.
//
//



import UIKit


class CollectionViewDataSource: NSObject, UICollectionViewDataSource{
	
    
    // Mock Data for the CollectionView
    let countries : [String] = [ "Mars",
                                 "Congo", "Spain",  "Cuba", "Lost",
                                "East Timor",
                                "Argentina",
                                "Egypt",
                                "Portigal",
                                "Equatorial Guinea",
                                "Zimbawe",
                                "Estonia",
                                "Austria",
                                "Faeroe Islands",
                                "Falkland Islands",
                                "China", "Finland", "Republic of Macedonia",
                                "France", "French Guiana","Mars",
                                "Congo", "Spain",  "Cuba", "Lost",
                                "East Timor",
                                "Argentina",
                                "Egypt",
                                "Portigal",
                                "Equatorial Guinea",
                                "Zimbawe",
                                "Estonia",
                                "Austria",
                                "Faeroe Islands",
                                "Falkland Islands",
                                "China", "Finland", "Republic of Macedonia",
                                "France", "French Guiana"  ]
    
    let cities : [String] = [ "Mars",
                                 "cidade", "Vila",  "Ruivaes", "Vienna",
                                 "Famalicao",
                                 "Buenos",
                                 "Cairo",
                                 "Lisboa",
                                 "Equa",
                                 "Zimbawe",
                                 "Vilnius",
                                 "Tulln",
                                 "Faeroe",
                                 "Islands",
                                 "Xi", "Reik", "Macedonia",
                                 "Paris", "Guiana","Marsius",
                                 "Duh", "Toledo",  "Aires", "Where",
                                 "Timor",
                                 "cidade", "Vila",  "Ruivaes", "Vienna",
                                 "Famalicao",
                                 "Buenos",
                                 "Cairo",
                                 "Lisboa",
                                 "Equa",
                                 "Zimbawe",
                                 "Vilnius",
                                 "Tulln",
                                 "Faeroe",
                                 "Islands",
                                 "Xi", "Reik", "Macedonia",
                                 "Paris", "Guiana","Marsius",
                                 "Duh", "Toledo",  "Aires", "Where",
                                 "Timor",
                                 "Argentina", ]
    
    //MARK: CollectionView DataSource Methods
    
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
		
	
	 func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 40
    }
	
	
	
	 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let hue = CGFloat(((indexPath as NSIndexPath).item)) / 40
        var cellColor = UIColor.clear
     
        cellColor = UIColor(hue: CGFloat(hue), saturation: 1.0, brightness: 1.0, alpha: 1.0)
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.cellreuseIdentifier, for: indexPath) as! Cell
        let temp = 40 - (indexPath as NSIndexPath).item
		cell.labelTemp.text = "\(temp)" + "º"
        cell.land.text = countries[(indexPath as NSIndexPath).item]
        cell.city.text = cities[(indexPath as NSIndexPath).item]
        cell.time.text = "12:\(temp)"
		cell.contentView.backgroundColor = cellColor
		
		
		return cell
	}

	
}//End



