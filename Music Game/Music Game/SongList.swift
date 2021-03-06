//
//  SongList.swift
//  Music Game
//
//  Created by Brendan Leder on 2017-02-23.
//  Copyright © 2017 Brendan Leder. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class SongList: SKScene {
    
    let back = TouchNode(imageNamed: "backButton")
    var songs = [String]()
    var artists = [String]()
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.gray
        back.position = CGPoint(x: self.size.width/16, y: self.size.height-self.size.width/32)
        back.size = CGSize(width: self.size.width/8, height: self.size.width/16)
        back.isUserInteractionEnabled = true
        back.zPosition = 2
        back.name = "splash"
        addChild(back)
        
        songs = ["Animal", "Feel Good Inc", "Gloe", "Run", "Africa", "Everybody Talks"]
        artists = ["Neon Trees", "Gorillaz", "Captian Murphy", "iamthekidyouknow", "Toto", "Neon Trees"]
        
        var testCellArray = [SongCell]()
        for i in 1...6 {
            let testCell = SongCell(imageNamed: "Rectangle")
            testCell.size = CGSize(width: self.size.width, height: self.size.height/6)
            testCell.position = CGPoint(x: self.size.width/2, y: CGFloat(i)*self.size.height/6-self.size.height/12)
            testCell.name = songs[i-1]
            testCell.setup(album: "albumart{\(i)}", song: songs[i-1], artist: artists[i-1])
            testCellArray.append(testCell)
            addChild(testCell)
            let testCellButton = TouchNode(imageNamed: "playButton")
            testCellButton.position = CGPoint(x:6*self.size.width/7, y: CGFloat(i)*self.size.height/6-self.size.height/12)
            testCellButton.size = CGSize(width: self.size.width/8, height: self.size.width/16)
            testCellButton.isUserInteractionEnabled = true
            testCellButton.zPosition = 2
            testCellButton.name = "gameButton"
            testCellButton.indexing = i-1
            addChild(testCellButton)
        }
    }
}
