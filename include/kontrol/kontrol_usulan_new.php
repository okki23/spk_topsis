<?php
include "../../koneksi.php";

$count = count($_POST['no_peg']); 
 
$hasil = '';
for($i=1;$i<=$count;$i++){
    $no_peg[$i]=$_POST["no_peg"][$i]; 
    $nama_peg[$i]=$_POST["nama_peg"][$i];
    $unit_kerja[$i]=$_POST["unit_kerja"][$i];
    $nilai_kerja[$i]=$_POST["nilai_kerja"][$i];
    $bagian[$i]=$_POST["bagian"][$i];
    $jabatan_peg[$i]=$_POST["jabatan_peg"][$i];
    $tgl_rangking[$i]=$_POST["tgl_rangking"][$i];
    $usulan="INSERT INTO usulan(no_pegawai,nama_pegawai,nama_unit_kerja,nilai,bagian,jabatan,periode)
    VALUES ('$no_peg[$i]','$nama_peg[$i]','$unit_kerja[$i]',$nilai_kerja[$i],'$bagian[$i]','$jabatan_peg[$i]','".$tgl_rangking[$i]."')";
     $hasil = mysqli_query($db_link,$usulan); 
     echo mysqli_error($db_link);
}

if ($hasil) {
    echo "berhasil";
} 
else {
    
    echo "gagal";
    echo mysqli_error($db_link);
}
?>