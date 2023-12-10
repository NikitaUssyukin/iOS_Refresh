/*
🤔#Задачка от WB: для Junior-программистов.

⚠️Сложность: 6/10

Описание: Опишите алгоритм для нахождения миллиона наименьших чисел в наборе из миллиарда чисел. Память компьютера позволяет хранить весь миллиард чисел. Если придумали какое-либо решение, то оцените его эффективность по времени.

Вопрос: Есть ли более эффективное решение?

*/

var array = [Int]()

for _ in 1...100 {
    array.append(Int.random(in: 1...1000))
}

print(array)
        
//var min = array[0]
//for i in 1...999 {
//    if(array[i] <= min) {
//        array.insert(array[i], at: 0)
//        array.remove(at: i)
//        min = array.first!
//    }
//}
//}

var i = 1;
while(i < 100) { // linear sort ?
    if(array[i] < array[i - 1]) {
        array.swapAt(i, i - 1)
        i = 0;
    }
    i += 1
}

print(array)
