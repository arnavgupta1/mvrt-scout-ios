//
//  ScoutingDataStructure.swift
//  MVRTScouting
//
//  Created by Alex Erf on 4/21/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import Foundation

struct ScoutingData {
    
    var auton = AutonData()
    var teleop = TeleopData()
    var postgame = PostgameData()
    
}

struct AutonData {
    
    enum StartingPosition {
        case StgArea, Landfill
    }
    
    var startPlace : StartingPosition = .StgArea
    var cansFromStep = true
    var getsYellowTotes = true
    var getsCanFromStgArea = true
    var endsInAutonZone = true
    var interferes = true
    
}

struct TeleopData {
    
    var totesFromLandfill = 0
    var totesFromFeeder = 0
    var totesLost = 0
    var stacksMade = 0
    var stacksKnockedOver = 0
    var stackCapped = true
    var noodlesInBin = true
    var noodlesToLandfill = 0
    var disabledStopped = true
    
}

struct PostgameData {
    
    var totesContributed = 0
    var efficiency = 0
    var stackAbility = 0
    var capAbility = 0
    var intakeAbility = 0
    var otherNoodles = 0
    var tippyRobot = true
    
}
