<?php

$host = "localhost"; 
$user = "xml"; 
$pass = "xml"; 
$database = "xml_project"; 

$db = mysqli_connect($host, $user, $pass, $database) or die("Could not connect to host."); 

$query = "SELECT * FROM sale"; 
$result= $db->query($query);

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"; 
echo "<sales>\n"; 

while($row = $result->fetch_assoc()){ 
    echo "\t<sale date=\"".$row['date']."\">\n";
    
        // Escaping illegal characters
        
        $row['description'] = str_replace("&", "&", $row['description']); 
        $row['description'] = str_replace("<", "<", $row['description']); 
        $row['description'] = str_replace(">", "&gt;", $row['description']); 
        $row['description'] = str_replace("\"", "&quot;", $row['description']);
    
    echo "\t\t<amount>".$row['amount']."</amount>\n";
    echo "\t\t<paid>".$row['paid']."</paid>\n";
    echo "\t\t<description>" . $row['description'] . "</description>\n";
    echo "\t\t<salesperson>".$row['salesperson']."</salesperson>\n"; 
    echo "\t</sale>\n"; 
} 

echo "</sales>"; 

?> 