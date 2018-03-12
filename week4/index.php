<?php 
    $name = trim($_POST['name']);
    $age=$_POST['age'];
    $gender = $_POST['gender'];
    $email =$_POST['email'];
    //连接数据库
$conn = mysqli_connect('localhost','usr_2017_38','waibujishu','db_2017_38');
//如果有错误，存在错误号
if(mysqli_errno($conn)){
    echo mysqli_error($conn);
    exit;
}
mysqli_select_db($conn,'guest');
mysqli_set_charset($conn,'utf8');
$sql = "insert into  guest (Guest_Name,Age,Gender,E_mail) values('$name','$age','$gender',' $email')";
$result = mysqli_query($conn,$sql);

echo '当前用户插入的ID为' . mysqli_insert_id($conn);
$sql = "select Guest_Name,Age,Gender,E_mail from guest order by Age desc";

$result = mysqli_query($conn, $sql);

if ($result && mysqli_num_rows($result)) {


   echo '<table width="800" border="1">';

   while ($row = mysqli_fetch_assoc($result)) {

       echo '<tr>';

       echo '<td>' . $row['Guest_Name'] . '</td>';
       echo '<td>' .  $row['Age']. '</td>';
       echo '<td>' .  $row['Gender'] . '</td>';
       echo '<td>' .  $row['E_mail'] . '</td>';
       

       echo '</tr>';
   }

   echo '</table>';

} else {
   echo '没有数据';
}

mysqli_close($conn);

?>