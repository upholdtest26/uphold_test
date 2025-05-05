# Assumptions

- strings from the standard input are double quoted - as in the examples from the description
- output strings to the standard output are double quoted as well - as in the examples from the description
- input strings are not exceeding RAM as we fully consume one before reading X 

# How to build
```
g++ ./string_padder.cpp -o ./string_padder 
```

# How to run tests
```
./tests.sh
```

# Time Complexity

O(N * log(N) + N * X) -> O(N * log(N)), 
N - number of characters in the input string, 
X - min number length

**std::getline** may keep re-allocating the string, which implies **O(N * log(N))** because there would be **log(N)** of such re-allocations if the string gets re-allocated at a fixed factor (which is a common implementation). And for simplicity, we may assume that each of such re-allocation will be done for N characters.

# Space Complexity

O(N), but in practice may end up O(N * log(N))
N - number of characters in the input string, 

In the supplied code, there is a string containing all the input characters and there is no reason for **std::getline** to allocate more. In practice, this may be more complicated, as **std::getline** will be allocating blocks of different sizes, which may remain on the heap - one may call **malloc_trim** manually in order to shrink the heap!
