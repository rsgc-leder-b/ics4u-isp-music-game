//
//  TouchNode.swift
//  Music Game
//
//  Created by Brendan Leder on 2017-02-22.
//  Copyright © 2017 Brendan Leder. All rights reserved.
//

import Foundation
import SpriteKit

class TouchNode : SKSpriteNode {
	
	var transistion : SKTransition = SKTransition.fade(withDuration: 1)
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let splashScreen : SKScene = GameScene(size: (self.scene!.frame.size))
		let songScene : SKScene = SongList(size: (self.scene!.frame.size))
		let settingScene : SKScene = Settings(size: self.scene!.frame.size)
		let playScene : SKScene = Play(size: self.scene!.frame.size)
		guard let theName = self.name else {
			return
		}
		switch theName {
		case "play":
			scene?.scene?.view?.presentScene(songScene)
			break
		case "setting":
			scene?.scene?.view?.presentScene(settingScene)
			break
		case "splash":
			scene?.scene?.view?.presentScene(splashScreen)
			break
		case "gameButton":
			scene?.scene?.view?.presentScene(playScene)
			break
		case "pause":
			scene?.scene?.view?.presentScene(songScene)
			break
		default:
			let name = theName.substring(to: theName.index(theName.startIndex, offsetBy: 3))
			if (name == "red" || name == "gre" || name == "blu") {
				self.removeFromParent()
				let score : SKNode = SKLabelNode(text: name)
				score.alpha = 0
				score.name = "score"
				self.parent?.addChild(score)
			}
			break
		}
		/*
		if scene?.name == "splashScreen" {
		if self.name == "play" {
		scene?.scene?.view?.presentScene(songScene)
		} else if self.name == "setting" {
		scene?.scene?.view?.presentScene(settingScene)
		}
		} else {
		if self.name == "splash" {
		scene?.scene?.view?.presentScene(splashScreen)
		} else {
		scene?.scene?.view?.presentScene(playScene)
		}
		}*/
	}
}
