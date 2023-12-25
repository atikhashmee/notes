
```
                   fetch(url,{
                        headers:{
                            "Content-Type": "application/json",
                            "Accept": "application/json",
                            "X-CSRF-TOKEN": "{{ csrf_token() }}",
                        },
                        credentials: "same-origin",
                        method:"POST",
                        body: JSON.stringify(obj)
                    })
                    .then(res=>res.json())
                    .then(res=>{
                        callback(res);
                    });
```
