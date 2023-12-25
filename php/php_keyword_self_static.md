Okay today I will discuss here when we use the keyword self and static, this is something in PHP language called "Late static binding"

lets see an example first and predict the answer of the program

```
class A {


        public static function showMessage()
        {
            echo "hello from main static form";
        }


        public function msg()
        {
            self::showMessage();
        }


   }

   class B extends A {
         
                public static function showMessage()
                {
                 
                      echo "from the second page";
                }
   }


   $a = new A();


   $b = new B();
   
   $a->msg();      //hello from main static form
   echo "<br>";
   $b->msg();       //hello from main static form
```
what? what's going on here? actually 
here be should return " from the second page" right? 
but it didn't 
okay we will examine step by step
PHP keyword "self" works with the class not with the object. that means when we extends the class A in the class B 
and calling the function "msg()" and its calling self::showMessage(). which is actually pointing to the its class function showMessage()
not the overridden one in the B

so how do we achieve that goal? 

we achieve that goal with the "static" keyword
we have to keep in mind that if we ever need to change or override any static function in the future by extending or by any other option
then we must declare it by the keyword 
static 

lets see the example

```
class A {
        public static function showMessage()
        {
            echo "hello from main static form";
        }
        public function msg()
        {
            static::showMessage();
        }

   }
   class B extends A {
         
                public static function showMessage()
                {
                 
                    echo "from the second page";
                }
   }

   $a = new A();
   $b = new B();
   
   $a->msg();      //hello from main static form
   echo "<br>";
   $b->msg();       //from the second page

 A::msg();
   echo "<br>";
  B::msg();
```

Now we resolved the issue. 


Thanks for reading



