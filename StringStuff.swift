import Foundation
//  Created by Melody Berhane
//  Created on 2023-04-09
//  Version 1.0
//  Copyright (c) 2023 Melody Berhane. All rights reserved.
//
//  This program finds the max run of lines in a file.

func findMaxRun(line: String) -> Int {
    // Declare the variables.
    var currentRun = 1
    var maxRun = 0

    // Checks if the line only holds one character.
    if line.count == 1 {
        maxRun = 1
    } else if line.count == 0 {
        maxRun = 0
    } else {

        // Go through the array and check if current character is the same
        // to the next one in the array.
        // For loop will not be executed if the line holds less than two
        // characters.
        for counter in 0..<line.count - 1 {
            if line[line.index(line.startIndex, offsetBy: counter)] == line[line.index(line.startIndex, offsetBy: counter + 1)] {
                currentRun += 1
            } else {
                currentRun = 1
            }

            if currentRun > maxRun {
                maxRun = currentRun
            }
        }
    }
    return maxRun
}

// Read in lines from input.txt.
let inputFile = URL(fileURLWithPath: "input1.txt")
let inputData = try String(contentsOf: inputFile)
let lineArray = inputData.components(separatedBy: .newlines)

// Open the output file for writing.
let outputFile = URL(fileURLWithPath: "output1.txt")

// Call function to find run and print to output file.
var runString = ""
for position in lineArray {
    let run = findMaxRun(line: position)
    // Write results to output 
    runString = runString + "\(run)\n"
    try runString.write(to: outputFile, atomically: true, encoding: .utf8)
}
