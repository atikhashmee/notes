__toString()
__set()
__get()
__call()
__callStatic()
__construct()
__destruct()
__sleep()
__wake()
__clone()
__debugInfo()
__isset()
__unset()
__invoke()
__autoload()

The very first note about PHP magic functions is they don't work outside the class. 
every magic function has its particular job. we will explore one by one

__toString():

     tostring() magic method return the class / object a string. like we can print the class with PHP echo function

     lets see an example
    
    
```
   class A{


         
         private $name;
         public function setName($name)
         {
             $this->name = $name;
         }
         public function getName()
         {
             return $this->name;
         }


         public function getExtraName()
         {
             return $this->name." Hi";
         }
         
         public function __toString()
         {
             return 'First'.$this->getName().'
 last'.$this->getExtraName();
         }
    }


    $a = new A();
    $a->setName("Atik");
    echo $a;
```

__set(), __get()

```
class A {


        public $data = array();
       
                public function __set($name, $value)
                {
                    $this->data[$name] = $value;
                }




                public function __get($name)
                {
                    if(array_key_exists($name,$this->data))
                    return $this->data[$name];
                }
    }


    $a = new A();


    $a->name = "John Due";
    echo $a->name;
```



