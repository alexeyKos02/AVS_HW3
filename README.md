# AVS_HW3
Третье идз АВС
# 4 балла
  > ![im1](images/4.png)
## Программа на C
[Здесь](/C_code/)
## Предоставлю сразу отредактированный код
[Здесь](/5point/mainAs.s)

Если вам интересны комментарии:
```sh
	.file	"main.c"
	.intel_syntax noprefix
	.text
	.local	START							# строка в которой ищем подстроку.
	.comm	START,1000,32					    	# выделение памяти на строку.
	.local	SEARCHABLE						# искомая подстрока.
	.comm	SEARCHABLE,1000,32					# выделение памяти в подстроку.
	.globl	randomDate						# объявление функции рандомной генерации данных.
	.type	randomDate, @function
 ```
 ## Тестирование
 Тесты расположены в данной [директории](/tests/).
 
 Результаты тестов сишного кода.
  > ![im2](/images/testC.png)
  
  Ввод данных для тестирования ассемблера.
  
  > ![imAs](/images/testAs.png)


## Компилирование и компановка без использования опции отладки.
> ![imComp](/images/comp.png)
## Вывод.
По результатам тестов мы видим, что и там, и там тесты проходят корректно. Также корректно обрабатываются неккоректные значения.

# 5 баллов 

  > ![im3](images/5.png)

## Передача данных через параметры 
Реализована в программе на 4 балла.
## Локальные переменные
Реализованы в программе на 4 балла.
## Два пункта о комментировании.
Можете взглянуть на код [здесь](/5point/)

# 6 баллов
  > ![im4](/images/6.png)
## Редактирование кода

Заменил -4[rbp] на r13d

Заменил -8[rbp] на r13d

заменил -20[rbp] на r14d

Получил отредактированный [код](/6point/max.s)

Данная программа прошла все тесты, что подтверждает ее работоспособность.
Попытался минимизировать использования стека, заменной на данные регистры.

## 7 баллов
  > ![im5](/images/7.png)

Все пункты реализованы в прошлых пунктах

## 8 баллов
  > ![im5](/images/8.png)
Отсчет времени можно увидеть в блоке на 4 балла, во время провведения тестов
