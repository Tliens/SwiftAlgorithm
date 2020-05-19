import UIKit
enum SortLevel{
    case low
    case middle
    case high
    case better
    case best
    case god
}
func bubleSort( numbers: [Int],level:SortLevel,up:Bool = true)->(newArray:[Int],calculateCount:Int){
    var sortNumbers = numbers
    var calculateCount = 0
    /// 最开始的版本，遍历 sortNumbers x sortNumbers  次
    if level == .low{
        for _ in 0..<sortNumbers.count - 1{
            for j in 0..<sortNumbers.count - 1{
                if up{
                    if sortNumbers[j] > sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                    }
                }else{
                    if sortNumbers[j] < sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                    }
                }
                calculateCount += 1
                
            }
        }
    }else if level == .middle{
        for i in 0..<sortNumbers.count - 1{
            for j in 0..<sortNumbers.count - 1 - i{
                if up{
                    if sortNumbers[j] > sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp

                    }
                }else{
                    if sortNumbers[j] < sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                    }
                }
                calculateCount += 1

            }
        }
    }else if level == .high{
        for i in 0..<sortNumbers.count - 1{
            var isSorted = false
            for j in 0..<sortNumbers.count - 1 - i{
                if up{
                    if sortNumbers[j] > sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                        isSorted = true
                    }
                }else{
                    if sortNumbers[j] < sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                        isSorted = true
                    }
                }
                calculateCount += 1
            }
            if isSorted == false{
                break
            }
        }
    }else if level == .better{
        var lastExchangeIndex = 0
        var sortBorder = sortNumbers.count - 1
        for _ in 0..<sortNumbers.count - 1{
            var isSorted = false
            for j in 0..<sortBorder{
                if up{
                    if sortNumbers[j] > sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                        isSorted = true
                        lastExchangeIndex = j
                    }
                }else{
                    if sortNumbers[j] < sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                        isSorted = true
                        lastExchangeIndex = j
                    }
                }
                calculateCount += 1
            }
            sortBorder = lastExchangeIndex
            if isSorted == false{
                break
            }
        }
    }else if level == .best{
        for i in 0..<sortNumbers.count/2{
            var isSorted = false
            // 从左往右
            for j in i..<sortNumbers.count - 1 - i{
                if up{
                    if sortNumbers[j] > sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                        isSorted = true
                    }
                }else{
                    if sortNumbers[j] < sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                        isSorted = true
                    }
                }
                calculateCount += 1
            }
            if isSorted == false{
                break
            }
            for j in i..<sortNumbers.count - 1 - i{
                let newJ = sortNumbers.count - 1 - i - j
                if up{
                    if sortNumbers[newJ] < sortNumbers[newJ-1]{
                        let temp = sortNumbers[newJ]
                        sortNumbers[newJ] = sortNumbers[newJ-1]
                        sortNumbers[newJ-1] = temp
                        isSorted = true
                    }
                }else{
                    if sortNumbers[newJ] > sortNumbers[newJ-1]{
                        let temp = sortNumbers[newJ]
                        sortNumbers[newJ] = sortNumbers[newJ-1]
                        sortNumbers[newJ-1] = temp
                        isSorted = true
                    }
                }
                calculateCount += 1
            }
            
            if isSorted == false{
                break
            }
        }
    }else if level == .god{
        for i in 0..<sortNumbers.count/2{
            var isSorted = false
            var lastExchangeIndex = 0
            var sortBorder = sortNumbers.count - 1
            // 从左往右
            for j in i..<sortBorder{
                if up{
                    if sortNumbers[j] > sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                        isSorted = true
                        lastExchangeIndex = j
                    }
                }else{
                    if sortNumbers[j] < sortNumbers[j+1]{
                        let temp = sortNumbers[j]
                        sortNumbers[j] = sortNumbers[j+1]
                        sortNumbers[j+1] = temp
                        isSorted = true
                        lastExchangeIndex = j
                    }
                }
                calculateCount += 1
            }
            sortBorder = lastExchangeIndex
            if isSorted == false{
                break
            }
            for j in i..<sortNumbers.count - 1 - i{
                let newJ = sortNumbers.count - 1 - i - j
                if up{
                    if sortNumbers[newJ] < sortNumbers[newJ-1]{
                        let temp = sortNumbers[newJ]
                        sortNumbers[newJ] = sortNumbers[newJ-1]
                        sortNumbers[newJ-1] = temp
                        isSorted = true
                    }
                }else{
                    if sortNumbers[newJ] > sortNumbers[newJ-1]{
                        let temp = sortNumbers[newJ]
                        sortNumbers[newJ] = sortNumbers[newJ-1]
                        sortNumbers[newJ-1] = temp
                        isSorted = true
                    }
                }
                calculateCount += 1
            }
            
            if isSorted == false{
                break
            }
        }
    }
    
    ///
    return (sortNumbers,calculateCount)
}
var needSortArray = [3,1,5,2,3,546,134,13,4,123,745]
//var needSortArray = [2,3,4,5,6,7,8,9,1,10]

let up = true

let numbersByBubleLow = bubleSort(numbers: needSortArray, level: .low,up: up)
print("numbersByBubleLow",numbersByBubleLow.newArray,numbersByBubleLow.calculateCount)

let numbersByBubleMiddle = bubleSort(numbers: needSortArray, level: .middle,up: up)
print("numbersByBubleMiddle",numbersByBubleMiddle.newArray,numbersByBubleMiddle.calculateCount)

let numbersByBubleHigh = bubleSort(numbers: needSortArray, level: .high,up: up)
print("numbersByBubleHigh",numbersByBubleHigh.newArray,numbersByBubleHigh.calculateCount)

let numbersByBubleBetter = bubleSort(numbers: needSortArray, level: .better,up: up)
print("numbersByBubleBetter",numbersByBubleBetter.newArray,numbersByBubleBetter.calculateCount)

let numbersByBubleBest = bubleSort(numbers: needSortArray, level: .best,up: up)
print("numbersByBubleBest",numbersByBubleBest.newArray,numbersByBubleBest.calculateCount)

let numbersByBubleGod = bubleSort(numbers: needSortArray, level: .god,up: up)
print("numbersByBubleGod",numbersByBubleGod.newArray,numbersByBubleGod.calculateCount)
