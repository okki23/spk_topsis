<?php 
error_reporting(0);
include_once "../../koneksi.php";
$id_jabatan = isset($_POST['id_jabatan']);
$sql = "select a.*,b.nama,c.nama_kegiatan,c.file_pendukung from jabatan_pegawai a 
left join pegawai b on b.no_pegawai = a.id_pegawai
left join pendukung c on c.id_pegawai = a.id_pegawai
where a.id_jabatan = '".$id_jabatan."' ";
$ex = mysqli_query($db_link,$sql);
$data = mysqli_fetch_assoc($ex);

$res_kegiatan = '';
$res_file = '';

if($data['nama_kegiatan'] == NULL || $data['nama_kegiatan'] == ''){
    
    $res_kegiatan = 'Belum Ada';
}else{
    $res_kegiatan = $data['nama_kegiatan'];
     
}

if($data['file_pendukung'] == NULL || $data['file_pendukung'] == ''){
    $res_file = 'Belum Ada'; 
}else{
    $res_file = "<a href='../../upload/'".$data['file_pendukung']."'> AAAA </a>"; 
}
 
echo "Nama Kegiatan : ".$res_kegiatan." <br> Berkas Pendukung : ".$res_file;
?>