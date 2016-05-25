//
//  firstUITableViewController.swift
//  mrt
//
//  Created by 黃建翔 on 2016/5/22.
//  Copyright © 2016年 黃建翔. All rights reserved.
//
import UIKit
import SwiftyJSON

//使用swiftyjson 整理json檔

struct DATA {
    
    var LINE : String
    var STATION : [String]
    var STALineNUM : [[String]]
    var STALineN2 : [[String]]
    
    init(title: String, objects : [String], no: [[String]], line: [[String]]) {
        
        LINE = title
        STATION = objects
        STALineNUM = no
        STALineN2 = line
    }
}

//MAKING SECTION

func MAKESECTION() -> [DATA] {
    
    let path = NSBundle.mainBundle().pathForResource("MRT", ofType: "json")
    let data = NSData(contentsOfFile: path!)
    let USINGJSON = JSON(data: data!)
    
    var line1Array = [String]() //板南
    var line2Array = [String]() //文湖
    var line3Array = [String]() //淡水信義
    var line4Array = [String]() //小碧潭
    var line5Array = [String]() //新北投
    var line6Array = [String]() //中和
    var line7Array = [String]() //松山
    var line8Array = [String]() //貓空
    
    var line1ArrayNo = [[String]]()
    var line2ArrayNo = [[String]]()
    var line3ArrayNo = [[String]]()
    var line4ArrayNo = [[String]]()
    var line5ArrayNo = [[String]]()
    var line6ArrayNo = [[String]]()
    var line7ArrayNo = [[String]]()
    var line8ArrayNo = [[String]]()
    
    var line1ArrayName = [[String]]()
    var line2ArrayName = [[String]]()
    var line3ArrayName = [[String]]()
    var line4ArrayName = [[String]]()
    var line5ArrayName = [[String]]()
    var line6ArrayName = [[String]]()
    var line7ArrayName = [[String]]()
    var line8ArrayName = [[String]]()
    
    for i in 0...USINGJSON.count {
        let name = USINGJSON[i]["name"].stringValue
        let linesName = USINGJSON[i]["lines"].map({ (x:(String, JSON)) -> String in
            x.0
        })
        let linesNumber = USINGJSON[i]["lines"].map({ (x:(String, JSON)) -> String in
            x.1.stringValue
        })
        
        if linesName.contains("板南線") {
            line1Array.append(name)
            line1ArrayNo.append(linesNumber)
            line1ArrayName.append(linesName)
        }
        
        if linesName.contains("文湖線") {
            line2Array.append(name)
            line2ArrayNo.append(linesNumber)
            line2ArrayName.append(linesName)
        }
        
        if linesName.contains("淡水信義線") {
            line3Array.append(name)
            line3ArrayNo.append(linesNumber)
            line3ArrayName.append(linesName)
        }
        
        if linesName.contains("小碧潭支線") {
            line4Array.append(name)
            line4ArrayNo.append(linesNumber)
            line4ArrayName.append(linesName)
        }
        
        if linesName.contains("新北投支線") {
            line5Array.append(name)
            line5ArrayNo.append(linesNumber)
            line5ArrayName.append(linesName)
            
        }
        
        if linesName.contains("中和新蘆線") {
            line6Array.append(name)
            line6ArrayNo.append(linesNumber)
            line6ArrayName.append(linesName)
        }
        
        if linesName.contains("松山新店線") {
            line7Array.append(name)
            line7ArrayNo.append(linesNumber)
            line7ArrayName.append(linesName)
        }
        
        if linesName.contains("貓空纜車") {
            line8Array.append(name)
            line8ArrayNo.append(linesNumber)
            line8ArrayName.append(linesName)
        }
        
    }
    
    var LINEArray = [DATA]()
    
    let LINE1 = DATA(title: "板南線", objects: line1Array, no: line1ArrayNo, line: line1ArrayName)
    let LINE2 = DATA(title: "文湖線", objects: line2Array, no: line2ArrayNo, line: line2ArrayName)
    let LINE3 = DATA(title: "淡水信義線", objects: line3Array, no: line3ArrayNo, line: line3ArrayName)
    let LINE4 = DATA(title: "小碧潭支線", objects: line4Array, no: line4ArrayNo, line: line4ArrayName)
    let LINE5 = DATA(title: "新北投支線", objects: line5Array, no: line5ArrayNo, line: line5ArrayName )
    let LINE6 = DATA(title: "中和新蘆線", objects: line6Array, no: line6ArrayNo, line: line6ArrayName )
    let LINE7 = DATA(title: "松山新店線", objects: line7Array, no: line7ArrayNo, line: line7ArrayName)
    let LINE8 = DATA(title: "貓空纜車", objects: line8Array, no: line8ArrayNo, line: line8ArrayName)
    
    LINEArray.append(LINE1)
    LINEArray.append(LINE2)
    LINEArray.append(LINE3)
    LINEArray.append(LINE4)
    LINEArray.append(LINE5)
    LINEArray.append(LINE6)
    LINEArray.append(LINE7)
    LINEArray.append(LINE8)
    
    return LINEArray
    
}

//讀json over

class firstUITableViewController: UITableViewController {
    
    var LINESections = MAKESECTION()
    
    //color setting
    
    func LabelColor(LineNumber:String) -> UIColor {
        if LineNumber.containsString("BR") {
            return UIColor(red: 158/255, green: 101/255, blue: 46/255, alpha: 1)
        } else if LineNumber.containsString("G") && !LineNumber.containsString("A") && !LineNumber.containsString("M") {
            return UIColor(red: 0/255, green: 119/255, blue: 73/255, alpha: 1)
        } else if LineNumber.containsString("O") {
            return UIColor(red: 255/255, green: 163/255, blue: 0/255, alpha: 1)
        } else if LineNumber.containsString("B") && !LineNumber.containsString("R") {
            return UIColor(red: 0/255, green: 94/255, blue: 184/255, alpha: 1)
        } else if LineNumber.containsString("R") && !LineNumber.containsString("B") && !LineNumber.containsString("A"){
            return UIColor(red: 203/255, green: 44/255, blue: 48/255, alpha: 1)
        } else if LineNumber.containsString("MG") {
            return UIColor(red: 119/255, green: 185/255, blue: 51/255, alpha: 1)
        } else if LineNumber.containsString("G03A") {
            return UIColor(red: 206/255, green: 220/255, blue: 0/255, alpha: 1)
        } else {
            return UIColor(red: 248/255, green: 144/255, blue: 165/255, alpha: 1)
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return LINESections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LINESections[section].STATION.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return LINESections[section].LINE
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        if LINESections[indexPath.section].STALineNUM[indexPath.row].count == 1 {
            
            //一個線的cell
            
            let firstCell = tableView.dequeueReusableCellWithIdentifier("line1cell", forIndexPath: indexPath) as! UITableViewCell1
            
            firstCell.nameLabel.text = LINESections[indexPath.section].STATION[indexPath.row] as String
            firstCell.firstLineLabel.text = LINESections[indexPath.section].STALineNUM[indexPath.row][0] as String
            firstCell.firstLineLabel.backgroundColor = LabelColor(LINESections[indexPath.section].STALineNUM[indexPath.row][0] as String)
            firstCell.firstLineNameLabel.text = LINESections[indexPath.section].STALineN2[indexPath.row][0] as String
            
            firstCell.firstLineLabel.textColor = UIColor.whiteColor()
            firstCell.firstLineLabel.layer.cornerRadius = 3
            firstCell.firstLineNameLabel.hidden = true
            
            return firstCell
            
        } else {
            
            //兩個線的cell
            
            let secondCell = tableView.dequeueReusableCellWithIdentifier("line2cell", forIndexPath: indexPath) as! UITableViewCell2
            
            secondCell.nameLabel.text = LINESections[indexPath.section].STATION[indexPath.row] as String
            secondCell.firstLineLabel.text = LINESections[indexPath.section].STALineNUM[indexPath.row][0] as String
            secondCell.secondLineLabel.text = LINESections[indexPath.section].STALineNUM[indexPath.row][1] as String
            secondCell.firstLineLabel.backgroundColor = LabelColor(LINESections[indexPath.section].STALineNUM[indexPath.row][0] as String)
            secondCell.secondLineLabel.backgroundColor = LabelColor(LINESections[indexPath.section].STALineNUM[indexPath.row][1] as String)
            secondCell.firstLineNameLabel.text = LINESections[indexPath.section].STALineN2[indexPath.row][0] as String
            secondCell.secondLineNameLabel.text = LINESections[indexPath.section].STALineN2[indexPath.row][1] as String
            
            secondCell.firstLineLabel.textColor = UIColor.whiteColor()
            secondCell.secondLineLabel.textColor = UIColor.whiteColor()
            
            secondCell.firstLineLabel.layer.cornerRadius = 3
            secondCell.secondLineLabel.layer.cornerRadius = 3
            
            secondCell.firstLineNameLabel.hidden = true
            secondCell.secondLineNameLabel.hidden = true
            
            return secondCell
        }
    }
    
    //做segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "show1" {
            let oneLineCell = sender as! UITableViewCell1
            let destinationController = segue.destinationViewController as! one
            destinationController.acceptStationName = oneLineCell.nameLabel.text!
            destinationController.acceptLine = oneLineCell.firstLineNameLabel.text!
            
        } else if segue.identifier == "show2" {
            
            let twoLineCell = sender as! UITableViewCell2
            let destinationController = segue.destinationViewController as! two
            destinationController.acceptStationName = twoLineCell.nameLabel.text!
            destinationController.acceptFirstLine = twoLineCell.firstLineNameLabel.text!
            destinationController.acceptSecondLine = twoLineCell.secondLineNameLabel.text!
            
        }
    }
    
}
