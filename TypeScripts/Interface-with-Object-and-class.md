***TypeScript Interfaces***

! Define Interface

```typescript
interface Person {
    name: string;
    addr: string;
    getName():string;
    getAddr():string;
}
```


**Use it with Class** 

```typescript
class Employee implements Person {
    name: string;
    addr: string;
    constructor(name: string, addr: string) {
        this.name = name;
        this.addr = addr;
    }

    getName(): string {
        return this.name;
    }

    getAddr(): string {
        return this.addr;
    }
}


class Doctor implements Person {
    name: string;
    addr: string;
    constructor(name: string, addr: string) {
        this.name = name; 
        this.addr = addr;
    }

    getAddr(): string {
        return this.addr
    }

    getName(): string {
        return this.name
    }
}
```

### Example of above usage

```typescript
 const rafid = new Employee("Rafid", "Khilgaon")
const kasim = new Doctor("kasim", "Banani")

const myArr: Person[] = []; 


myArr.push(rafid)
myArr.push(kasim)


console.log(myArr);

```




