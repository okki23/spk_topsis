<?php
include_once "../../koneksi.php";

function upload_foto(){  
    if(isset($_FILES["file"])){  
        $extension = explode('.', $_FILES['file']['name']);   
        $destination = '../../upload/' . $_FILES['file']['name'];  
        return move_uploaded_file($_FILES['file']['tmp_name'], $destination);  
         
    }  
  }  
if(isset($_POST['id_pegawai'])){


  if (isset($_POST['crud'])){
        if($_POST['crud']=='update'){
            $id_pegawai=$_POST['id_pegawai'];
            $pendukung_name=$_POST['pendukung_name'];
            $password=$_POST['password'];
			$hak_akses=$_POST['hak_akses'];
            $sql_update="UPDATE pendukung SET pendukung_name='$pendukung_name',password='$password',hak_akses='$hak_akses',id_pegawai='$id_pegawai'
			WHERE id_pegawai='$id_pegawai'";
            $hasil = mysqli_query($db_link,$sql_update);
            if($hasil){
                echo "berhasil";
            }
            else{
                echo "gagal";
                echo mysqli_error();
            }
        }

        if($_POST['crud']=='tambah'){ 
            $id_pegawai=$_POST['id_pegawai'];
            $nama_kegiatan=$_POST['nama_kegiatan']; 
			$file= $_FILES['file']['name']; 
            upload_foto();
            $sql_tambah="INSERT INTO pendukung (id_pegawai, file_pendukung, nama_kegiatan) 
			VALUES ('".$id_pegawai."', '".$file."','".$nama_kegiatan."')";
            $hasil = mysqli_query($db_link,$sql_tambah); 
            
            if ($hasil) {
                echo "berhasil";
            } 
            else {
                echo "gagal";
                echo mysqli_error($db_link);
            }
        }

        if($_POST['crud']=='hapus'){
           $pendukung_name = $_POST['pendukungname'];
            $id_pegawai=$_POST['id_pegawai'];
            $sql_delete = "DELETE from pendukung where id_pegawai='$id_pegawai' AND pendukung_name='$pendukung_name'";
            $hasil = mysqli_query($db_link,$sql_delete);
            if($hasil){
                 echo "berhasil";
            }
            else{
             echo "gagal";
                echo mysqli_error();
            }
        }
    };
};
?>
