
Vuex is nothing but a flux design pattern implemented in vuesj library
we will take a look at this 


1. state
2. mutations
3. actions
4. getters

these 4 compose vuex that's it. 

for example we have multiple global state variable
we can combine them with module

1. create a folder name 'store' 
2. create a file name 'index.js' inside store folder

	paste the like code below inside that file
```
import Vue from 'vue'; 
import Vuex from 'vuex'; 
import products from './modules/product' 
Vue.use(Vuex); 
export default new Vuex.Store({ 
    modules:{ 
        products 
    } 
});
```
3. create another folder inside store folder called modules
4. create your first module , my module name is products so create products.js

```
export default { 
    state: { 
        msg : "hello world how are you", 
        count: 0, 
    }, 
    mutations: { 
        increment(state){ 
            state.count++ 
        }, 
    }, 
    actions: { 
        increment(context) 
        { 
            console.log('happening'); 
             
            context.commit('increment'); 
        } 
    }, 
    getters: { 
        mycount: state=> state.count, 
    } 
}
```
5. that's it, now as final steps you need to register vuex to vue instance
```
import store from './store' 
new Vue({ 
  render: h => h(App), 
  store, 
}).$mount('#app')
```
we are done here. 


now how to use it. 
go to you component wherever you use vuex 
```
<template> 
  <div class="hello"> 
    <h1>{{ msg }}</h1> 
    <p> 
      For a guide and recipes on how to configure / customize this project,<br> 
      check out the 
      <a href="https://cli.vuejs.org" target="_blank" rel="noopener">vue-cli documentation</a>. 
    </p> 
    <h3>Installed CLI Plugins {{myCount}} </h3> 
      <button @click="hitme">Hello click</button> 
  </div> 
</template> 
<script> 
export default { 
  name: 'HelloWorld', 
  props: { 
    msg: String 
  }, 
  computed: { 
    myCount(){ 
      return this.$store.state.products.count; 
    } 
  }, 
  methods: { 
      hitme(){ 
          this.$store.dispatch('increment'); 
      }, 
  },  
  created(){ 
    this.sayHello('component mixing'); 
  }, 
} 
</script>
```

Whooo! we're done 
