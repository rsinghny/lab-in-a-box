<?php
//call Signal Sciences Module
require_once('sigsci.php');

$sigsci = new SigSciModule();
$sigsci->preRequest(); // Gathers request details for the agent

if ($sigsci->block()){
http_response_code(406);
echo "406 - Blocked (Invalid Request Detected)";
$sigsci->postRequest();
exit();
}

echo '<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="description" content="Signal Sciences">
        <meta name="author" content="Signal Sciences">
        <title>Lab-In-A-Box - PHP</title>
    </head>
    <body>
        <p>Welcome to lab-in-a-box PHP!</p>
    </body>
    </html>';

if("GET" == $_SERVER['REQUEST_METHOD']) {
    echo "GET<br><hr>";
    var_dump($_GET);
}

if("POST" == $_SERVER['REQUEST_METHOD']) {
echo "POST<br><hr>";
    var_dump($_POST);
}
?>

<br><br><br><hr>
Get XSS Attack
<br>
<form action="index.php" method="GET">
<input type="hidden" name="gParam1" value="<script>alert()<script>">
<input type="submit">
</form>

<br><br><br><hr>
Post XSS Attack
<br>
<form action="index.php" method="POST">
<input type="hidden" name="pParam1" value="<script>alert()<script>">
<input type="submit">
</form>

<br><br><br><hr>
Dump Headers
<br>
<?php
foreach (getallheaders() as $name => $value) {
    echo "$name: $value<br>";
}

$sigsci->postRequest();
?>

