Hi today i am gonna talk about what is javascript clouser

To understand this we have to first understand what is variable scope in javascript

there are two well defined scope in javascript ]
1.  local scope
2. global scope

before moving into this scope things we have to first understand javascript executional context

a self executable clouser 

```
(function(x){
     
     return function(y){
        console.log(x+" "+y);
     }(2);
     
}(1);
//1 2
```


a variable returned clouser with further callable

```
var obj = (function(x){
              return function(y){
               console.log(x+" "+y);
             } 
          }(1);

obj(2); // here you are sending the value to returnable clouser
// 1  2 
```
