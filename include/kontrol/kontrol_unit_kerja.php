<?php
include_once "../../koneksi.php";

if(isset($_POST['id_unit_kerja']) || isset ($_POST['nama_unit_kerja'])|| isset($_POST['alamat_unit_kerja'])){


    if (isset($_POST['crud'])){
        if($_POST['crud']=='update'){
            $id_unit_kerja=$_POST['id_unit_kerja'];
            $nama_unit_kerja=$_POST['nama_unit_kerja'];
            $alamat_unit_kerja=$_POST['alamat_unit_kerja'];
            $proses="UPDATE unit_kerja SET nama_unit_kerja='$nama_unit_kerja',alamat_unit_kerja='$alamat_unit_kerja' WHERE id_unit_kerja='$id_unit_kerja'";
            $hasil = mysqli_query($db_link,$proses);
            if($hasil){
                echo "berhasil";
            }
            else{
                echo "gagal";
                echo mysqli_error();
            }
        }

        if($_POST['crud']=='tambah'){
        $nama_unit_kerja=$_POST['nama_unit_kerja'];
        $alamat_unit_kerja=$_POST['alamat_unit_kerja'];
            $sql = "INSERT INTO unit_kerja (nama_unit_kerja,alamat_unit_kerja)
                    VALUES ('".$nama_unit_kerja."','".$alamat_unit_kerja."') ";
            $hasil = mysqli_query($db_link,$sql); 
            
            if ($hasil) {
                echo "berhasil";
            } 
            else {
                echo "gagal";
                echo mysqli_error();
            }
        }

        if($_POST['crud']=='hapus'){
           $id_unit_kerja = $_POST['id_unit_kerja'];
            $sql = "DELETE from unit_kerja where id_unit_kerja=".$id_unit_kerja;
            $hasil = mysqli_query($db_link,$sql);
            if($hasil){
                 echo "berhasil";
            }
            else{
             echo "gagal";
                echo mysqli_error();
            }
        }
    }
}
?>
