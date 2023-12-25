

```
  const app  = new Vue({
            el:"#myApp",
            data:dataVar,
            methods:mthd,
            created(){
                this.initValue();
                this.each_bid = parseFloat(this.bidMin);
            },
            mounted() {
                 this.allservices = <?=json_encode($services)?>;

            },
            computed:compute,
            watch:watcher,

        });

```
