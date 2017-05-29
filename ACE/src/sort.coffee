#cus i am lazy
print = console.log
#mutable sort
sort = (input)=>
    if(input.length <= 2)
        return input
    # print "Sorting #{input}"
    lP       = 0
    rP       = input.length - 1
    pivot    = Math.floor(input.length/2) 
    leftBit  = []
    rightBit = []
    loop
        if(input[lP] > input[pivot])
            rightBit.push(input[lP])
        else
            leftBit.push(input[lP])
        lP++
        if(lP == pivot)
            break
    loop
        if(input[rP] > input[pivot])
            rightBit.push(input[rP])
        else
            leftBit.push(input[rP])
        rP--
        if(rP == pivot)
            break
    # print "Left bit #{leftBit} pivot was #{input[pivot]} right bit was #{rightBit}\n"
    return sort(leftBit).concat(input[pivot]).concat(sort(rightBit))

genArray = (size) =>
    tmp = []
    for i in [1..size]
        tmp.push(Math.floor(Math.random()*size))
    return tmp

arr = genArray(10000000)
start = Date.now()
sort arr
print "Pedro sort #{Date.now() - start}"
start = Date.now()
arr.sort()
print "JS sort #{Date.now() - start}"

