descendant selector 
  
```
div p { 
  background-color: yellow; 
}
```
it does not matter how deep the p tag is inside the div , it will target the p tag and apply the css



Child Selector

  
```
div > p {
  background-color: yellow;
}
```
here it mean the p tag has to be the direct child of div tag, then only it will apply the css


Adjacent Sibling Selector

```
<div> 
  
<h3>Paragraph 3. Not in a div.</h3>
  <p>Paragraph 1 in the div.</p> 
  <p>Paragraph 2 in the div.</p> 
  <h3>Paragraph 3. Not in a div.</h3> 
  <p>Paragraph 3. Not in a div.</p>
<p>Paragraph 3. Not in a div.</p>
<h3>Paragraph 3. Not in a div.</h3>
  <p>Paragraph 4. Not in a div.</p>
</div> 
h3 + p {
   color: lightblue;
}

```
here it means whereever it finds p tag after h3 tag , it will apply the style. and that is also the immidiate one. not the others, that means if there is others p tag 
after h3 tag, it will not make a difference


General Sibling Selector

```
<div>
  <h3>Paragraph 3. Not in a div.</h3>
  <p>Paragraph 1 in the div.</p>
  <p>Paragraph 2 in the div.</p>
  <h3>Paragraph 3. Not in a div.</h3> 
  <p>Paragraph 3. Not in a div.</p>
  <p>Paragraph 3. Not in a div.</p>
  <h3>Paragraph 3. Not in a div.</h3>
  <p>Paragraph 4. Not in a div.</p>
</div>
h3 ~ p {
   color: lightblue;
}

```
here it means no matter how many of p tag after h3 , it will select all of them. and target them and apply the style

Cases
#1
```
#header.callout {  } 
#header .callout { }
```
This may seem pretty similar. but they are not. 
the second we already discussed above. but the top one means this
```
<div id="header" class="callout">
    
</div>
```

That's it.  now enjoy




Now scss selectors
---
brief history of  ampersand  in scss 

for all the basic selector in css it can be used in short hand like this, 
```
div {
    &:hover{
     }
     &:visited{ 
     }
}

div { 
     & + p{ 
     } 
     
    & >  p{  
         }
    & ~  p{   
         }
}

```
above all are basic css compilation done in  scss
so now we will explore some advance things in here 
```
.btn{
   &-primary{
    }
}
```
This is actually concating the class in , and this is done using scss easily, can be called as a conditional rendering
