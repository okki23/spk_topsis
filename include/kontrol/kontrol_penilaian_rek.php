<?php 
error_reporting(0);
include_once "../../koneksi.php";
$id_jabatan=$_GET['id_jabatan'];

$sqlrek = "select a.*,b.nama from pendukung a 
left join pegawai b on b.no_pegawai = a.id_pegawai
left join jabatan_pegawai c on c.id_pegawai = a.id_pegawai
   where c.id_jabatan = '".$id_jabatan."' ";
$exrek = mysqli_query($db_link,$sqlrek); 
// $datarek = mysqli_fetch_array($exrek);  
$no = 1;
echo '<table class="table table-bordered table-hover text-center panel panel-primary" id="example">
        <tr>
        <td> No </td>
        <td> Nama Berkas Pendukung </td>
        <td> File Pendukung </td>
        </tr>
';
while($datarek = mysqli_fetch_array($exrek)){
   echo "<tr> 
            <td>".$no."</td>
            <td>".$datarek['nama_kegiatan']."<td>
            <td>".$datarek['file_kegiatan']."<td>
            ";
$no++;
}

// $res_nk = '';
// $res_fk = '';
// if($datarek['nama_kegiatan'] != NULL || $datarek['nama_kegiatan'] != ''){
//     $res_nk = $datarek['nama_kegiatan'];
// }else{
//     $res_nk = ' - '; 
// }

// if($datarek['file_pendukung'] != NULL || $datarek['file_pendukung'] != ''){ 
//     $res_fk = '<a href="http://localhost/spk_topsis/upload/'.$datarek['file_pendukung'].'" target="_blank"> Download File </a>';
// }else{
//     $res_fk = ' - ';
// }

// echo "<br> <div align='center'> <h3> <b> Nama Kegiatan : ".$res_nk." </b> </h3> <br> <h3> <b> File Pendukung : ".$res_fk." </b> </h3> </div> <br> &nbsp;";
?>
<script src="../vendor/jquery/jquery.min.js"></script>
 
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">