
using object oriented programing

```
date_default_timezone_set('UTC'); 
$datetime = new DateTime('30.04.2020 18:00'); 
echo $datetime->format('Y-m-d H:i:s') . "n"; 
$la_time = new DateTimeZone('America/Chicago'); 
$datetime->setTimezone($la_time); 
echo $datetime->format('Y-m-d h:i:s');
```

using procedure 
```
//date_default_timezone_set('UTC'); 
        $date = date('Y-m-d H:i:sP', $strtime); 
        //date_default_timezone_set('America/Chicago'); 
        if ($original) { 
            $date = date('Y-m-d', strtotime($date)); 
        } else { 
            $date = date('m/d/Y', strtotime($date)); 
        } 
        //date_default_timezone_set('UTC'); 
        return $date;
```


```
strtotime() == date_timestamp_get( new DateTime()//object)
```
