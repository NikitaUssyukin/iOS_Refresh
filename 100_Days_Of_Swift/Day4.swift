//Loops

//for loop
let count = 1...10

for number in count {
    print("Number is \(number)")
}

let cars = ["Miata", "Civic", "Yaris"]

for car in cars {
    print("The car is \(car)")
}

for _ in 1...5 {
    print("tick")
}

//while loop
var num = 1

while num <= 20 {
    print(num)
    num += 1
}

print("End of count.")

//repeat loop
var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20
            
print("End of count.")
            
//exiting loops
var countDown = 10
while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        print("Countdown terminated.")
        break
    }
    
    countDown -= 1
}

//exiting multiple (nested) loops
//You can exit a single loop using break, but if you have nested loops you need to use break followed by whatever label you placed before your outer loop
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("Halfway through, loop terminated.")
            break outerLoop
        }
    }
}

//skipping items
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}

//infinite loops
//Infinite loops don’t end until you ask them to, and are made using while true. Make sure you have a condition somewhere to end your infinite loops
var counter = 0

while true {
    print("")
    counter += 1
    
    if counter == 273 {
        break
    }
}
