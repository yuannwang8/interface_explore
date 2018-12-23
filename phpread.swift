import Foundation

// $ swift phpread.swift "5" "2" // Testing at Command Line.  Do not uncomment

let npicks:Int = Int(CommandLine.arguments[1])!
let nruns:Int = Int(CommandLine.arguments[2])!

// print("total numbers picked = \(npicks * nruns)")

let Imin = 1, Imax = 50
    
let xrange = Array(Imin ... Imax)
    
var x1: [Int] = []
for _ in 1 ... nruns {
    let xi = xrange.shuffled().prefix(npicks)
    x1 += xi
}
    
let countxd = Dictionary(grouping: x1, by: { $0 })
    
let countxt = countxd.map { (key: Int, value: [Int]) in
    return(value.count, key)
}
// print("countxt: \(countxt)")
    
let countxval = countxt.sorted( by: { $0 > $1} )
// print("countxval: \(countxval)")
    
let kcutoffvalue = countxval[npicks - 1].0
// print("kcutoffvalue: \(kcutoffvalue)")
    
var xc1: [Int] = []
var xc2: [Int] = []
for (val, key) in countxval {
    if val > kcutoffvalue {
        xc1.append(key)
    } else if val == kcutoffvalue {
        xc2.append(key)
    }
}
 
let xc2pick = npicks - xc1.count
    
// print("xc1: \(xc1)")
// print("xc2: \(xc2)")
    
var mostfreqpicks: [Int] = []
if xc2.count == 1 {
    // print("loop1")
    mostfreqpicks = xc1 + xc2
} else {
    // print("loop2\nxc2pick: \(xc2pick)")
    let xc3 = xc2.shuffled().prefix(xc2pick)
    // print("xc3: \(xc3)")
    mostfreqpicks = xc1 + xc3
}

mostfreqpicks.sort()
// print("mostfreqpicks: \(mostfreqpicks)")

// define output to be saved
    
let arraytoprint = mostfreqpicks
let arraytostring = arraytoprint.compactMap {String($0)}
let stringtoprint = arraytostring.joined(separator: ", ")
    
let text1 = stringtoprint
    
// print(text1)
    
// save output
    
let file1 = "outputs.txt" //
do{
   try text1.write(toFile: file1, atomically: false, encoding: .utf8)
} catch {/* error handling here */}

// end save output
    

