
```
if (isset($_GET['step']) && $_GET['step']==2) {
$file_name = 'sample.pdf';
$file_url = 'http://localhost/' . $file_name;
header('Content-Type: application/octet-stream');
header("Content-Transfer-Encoding: Binary");
header("Content-disposition: attachment; filename=\"".$file_name."\"");
readfile($file_url);
header('Location: asdf.php?step=3');
echo 2;
}
```

```
<a href="asdf.php?step=2" id="the-link">test</a>
<script>
var link = document.getElementById("the-link");
link.addEventListener("click", function(evt) {
// Stop the link from doing what it would normally do.
evt.preventDefault();
// Open the file download in a new window. (It should just
// show a normal file dialog)
window.open(this.href, "_blank");
// Then redirect the page you are on to whatever page you
// want shown once the download has been triggered.
window.location = "/thank_you.html";
}, true);
</script>
```



```
<?php
header("Content-Type: application/octet-stream");
$file = $_GET["file"] .".pdf";
header("Content-Disposition: attachment; filename=" . urlencode($file));   
header("Content-Type: application/octet-stream");
header("Content-Type: application/download");
header("Content-Description: File Transfer");            
header("Content-Length: " . filesize($file));
flush(); // this doesn't really matter.
$fp = fopen($file, "r");
while (!feof($fp))
{
    echo fread($fp, 65536);
    flush(); // this is essential for large downloads
} 
fclose($fp);
echo json_encode (['ss'=>'hhhhhhhh elllo']);
```


```
<!doctype html>
<html lang="en">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  </head>
  <body>
  <button type="button" onclick="downloadble()"> Eddit</button>
  <!-- <a href="mydownload.php?file=Atik_Resume.pdf" id="downlaoble"> asdfadsfds</a> -->
  <a href="mydownload.php?file=https://www.ifac.org/system/files/publications/files/ipsas-24-presenta.pdf" id="downlaoble"> asdfadsfds</a>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
       function downloadble()
       {
            $.ajax({
                type: "GET",
                url: "mydownload.php?file=Atik_Resume.pdf",
                success: function (response) {
                    console.log(response);
                    document.getElementById('downlaoble').click();
                }
            });
       }  
      
    </script>
  </body>
</html>
```
