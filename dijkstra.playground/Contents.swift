
var array : [[Int]] = []
var arrayX = [Int]() // массив строки с бесконечностями T
let n = 7 // колличество вершин графа
var startPos = 0
var wievedArr = [startPos] // просмотренные вершины S
//инициализация массива
for row in 0 ..< n {
    array.append([Int]())
    for z in 0 ..< n {
        array[row].append(0)
        if ((row == 0) && ((z == 2) || (z == 3))) || ((row == 1) && ((z == 2) || (z == 3) || (z == 4) || (z == 5) )) || ((row == 2) && (z == 4)) || ((row == 3) && (z == 5)) || ((row == 4) && (z == 6)) || ((row == 5) && (z == 6)) { // здесь задаются правила для генерации массива , закоменнтируйте if и раскомментируйте if ниже, если это правила не нужны нужно
            array[row][z] = Int.random(in: 1 ... 9)
        } else {
            array[row][z] = 0
        }
        /* // генерирует массив без правил
        if row == z {
            array[row][z] = 0
        } else {
            array[row][z] = Int.random(in: 1 ... 9)
        }*/
    }
    arrayX.append(Int.max)
}
for row in 0 ..< n { // делает массив симметричным
    for z in 0 ..< n {
            array[z][row] = array[row][z]
        }
}
array.forEach({print($0)})


func nonNill (startPosition : Int , arrayFin : [[Int]]) -> [Int] { // non нулевые значения массива
    var azamat = [Int]()
    for x in 0 ..< n {
        if arrayFin[startPosition][x] > 0 {
            azamat.append(x)
        }
    }
    return azamat
}

func arcMin (arrayT : [Int] , arrayS : [Int]) -> Int { // если значение минимально и не содержится в массиве просмотренных вершин
    var amin = -1
    var m  = arrayT.max()!
    for i in 0 ..< arrayT.count {
        if (arrayT[i] < m) && (!arrayS.contains(i) ) {
            m = arrayT[i]
            amin = i
        }
    }
    
    return amin
}

arrayX[startPos] = 0

var why = 0 // сумма пути от первой вершины

while startPos != -1 {
for i in nonNill(startPosition: startPos, arrayFin: array) {
  
    if !wievedArr.contains(i) {
        why = arrayX[startPos] + array[startPos][i]
        if why < arrayX[i] {
            arrayX[i] = why
        }
    }
    
    }
    startPos = arcMin(arrayT: arrayX, arrayS: wievedArr)
    if startPos > 0 {
        wievedArr.append(startPos)
        
    }
    
}
for x in 0 ..< arrayX.count {
    print("Путь от вершины 1 до \(x+1) = \(arrayX[x])")
    
}
