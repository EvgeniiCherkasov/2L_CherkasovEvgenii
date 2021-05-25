import UIKit

//MARK: Задание 1
//Написать функцию, которая определяет, четное число или нет

func isEven(number: Int) -> Bool{
    
    let reminderOfTheDevision: Int
    
    reminderOfTheDevision = number % 2
    
    switch reminderOfTheDevision {
    case 0:
        return true
    default:
        return false
    }
}
//Проверка Задания 1
print(isEven(number: 2))
print(isEven(number: 3))


//MARK: Задание 2
//Написать функцию, которая определяет, делится ли число без остатка на 3.

func zeroDivisionOnThree(number: Int) -> Bool{
    
    let reminderOfTheDevision: Int

    reminderOfTheDevision = number % 3

    switch reminderOfTheDevision {
    case 0:
        return true
    default:
        return false
    }
}

//Проверка Задания 2
print(zeroDivisionOnThree(number: 9))
print(zeroDivisionOnThree(number: 16))

//MARK: Задание 3
//Создать возрастающий массив из 100 чисел

func arrayCreator(firstNumber: Int, lastNumber: Int) -> [Int]{
    
    let array = [Int] (firstNumber...lastNumber)
  
    return array
}

//Проверка Задания 3
print(arrayCreator(firstNumber: 1, lastNumber: 10))

//Задание 4
//Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var array = arrayCreator(firstNumber: 3, lastNumber: 15)

for i in array{
    if isEven(number: i){
        array.remove(at: array.firstIndex(of: i)!)
    }else if !zeroDivisionOnThree(number: i){
        array.remove(at: array.firstIndex(of: i)!)
    }
}
//Проверка Задания 4
print(array)

//Задание 5
//* Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

//Функция добавления n числе Фибоначи
func addFibonachiNumber(array: inout [Int], numberOfFibonachiElements: Int) -> [Int]{

    let arrayCount = array.count
    var i = arrayCount
    
    while i < arrayCount + numberOfFibonachiElements{
        
    let numberOfElements = array.count
    switch numberOfElements {
    
    case 1 where array[0] == 0:
        array.append(1)
    case 1:
        array.append(array[0])
    default:
        let newElement = array[i - 1] + array[i - 2]
  
        array.append(newElement)
    }
            i = i + 1
    }
    
    return array
}

//добавление Числел фибоначи в массив
print(addFibonachiNumber(array: &array, numberOfFibonachiElements: 4))

//Задание 6
//   * Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно //делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100), //следуя методу Эратосфена, нужно выполнить следующие шаги:
//   a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно



func algoritmEratosphen(n: Int) -> [Int] {
    
    arrayCreator(firstNumber: 2, lastNumber: n)
    
    var array: [Int] = []
    var tmpArray = arrayCreator(firstNumber: 2, lastNumber: n)
    
    var p: Int = 2
    var index: Int = 0
    
    while p * p < n {
        
        array = tmpArray
        
        for i in array{
            if i % p == 0 && p != i{
                array.remove(at: array.firstIndex(of: i)!)
            }
        }
        
        tmpArray = array
        
        index = index + 1
        
        p = array[index]
    }
    
    return array
}

print(algoritmEratosphen(n: 50))





