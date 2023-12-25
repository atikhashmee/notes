Oke here is the deal, If there were some black magic that comes to me and teach me about everything I would be the first who will clap out of nothing. this is what something similar happened to me

I was pretty and super lazy that knew everything but no learning. 

when i started programming, I thought i knew everything. but later on i understood i know nothing out of the box. 
and that is because I would not practice much whatever I learned at the time. 
then when It came over to me professionally, I am pretty much stuck at everything I am touching at the moment, things started looking at me like I never seen them before. 
lets not get into all these. 

we all know by the name access modifier by its phrase pretty much. 
so in php also there are three access modifier
1.public 2. protected 3. private
if you declare any thing with public keyword suffix then it will be visible to the everything you call this variable or function property. 
for example

```
class MyExample{
    

   public $myproperty ="hey there";

}

class SecondExample{
      public __construct(){
        $obj = new MyExample();
        echo $obj->myproperty;
      }
}
new SecondExample();
//hey there

```
if you run this little code you will get this result out of the box
Protected:
protected declared elements are only visible to those classes who extends them
to understand it better we can stick to our previous example 
```
class MyExample{
   protected $myproperty = "hi there";
   
}
class SecondClass extends MyExample{
   public __construct(){
       echo $this->myproperty;
   }
}
new SecondClass();
// hi there
```
Private:
Private declared properties are only available to the class they are declared in
not in outside world. so if you try to do anything with private property you will get an fatal error, 
exception

Oke up until now  I am discussing about property like variable and etc. what about methods ? 
methods are also same in php. if you declare any method a public that means this methods is accessed by everyone, and can override anyone class who inherit that. 
 and protected can not be overriden by its child class . but can only be called from the class who inherit it. 

how about constructor being public , private , protected means? 

constructor being private and protected means this class is not visible to the outside world, means if this is private then no body can inherit it nor instantiate it. and if it is protected that means this can be inherit but can not be instantiated by the outsider world. 





public 
private
protected
variable
access/override
no access / no override
inherited access / but no override
methods
access/override
no access /no override
inherited access / but no override
constructor
can instantiate / inherit
no instance / no inherit
no instance / but inherit

Ok here done with access modifier

lets learn some of the keywords 

Final:
First of all, in php you can not set any variable to be final. you can only set a class to be final and a methods to be final. 

If you do so they will fire you an error saying you can not set any variable to be final. 

ok what about a methods being final? 
a method being final means the method can only be accessed by outsider world but can not override that method. 

Ok what about a class being final means? 
A class being final means this class can not be inherit by any class. can only instantiate the class.
