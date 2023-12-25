
```
var dateMy = ob.Race_date;//'12.03.2020 15:24';
                    // var dateArr = dateMy.split('.');
                    var dateArr = dateMy.split(/[/.]/);
                    console.log(dateArr);
                    let yy = dateArr[2].split(' ');
                    var newDate = dateArr[1] + '.' + dateArr[0] + '.' +dateArr[2]+' UTC+01:00';
                    console.log(newDate);
                    
                    let d = Date.parse(newDate);
                    var options = {
                        year: 'numeric', month: 'numeric', day: 'numeric',
                        hour: 'numeric', minute: 'numeric',
                        hour12: true,
                    };
                    options.timeZone = 'America/Chicago';
                    ob.Race_date = new Intl.DateTimeFormat('en-US', options).format(d);
                    return ob;
```
