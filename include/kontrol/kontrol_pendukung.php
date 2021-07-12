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
            $nama_kegiatan=$_POST['nama_kegiatan']; 
			$file= $_FILES['file']['name'];  

            upload_foto();
            if(!empty($file)){
                $sql_update="UPDATE pendukung SET file_pendukung = '".$file."', nama_kegiatan = '".$nama_kegiatan."' where id_pegawai = '".$id_pegawai."' ";
            }else{
                $sql_update="UPDATE pendukung SET  nama_kegiatan = '".$nama_kegiatan."' where id_pegawai = '".$id_pegawai."' ";
            } 
            
            $hasil = mysqli_query($db_link,$sql_update); 
            
            if ($hasil) {
                echo "berhasil";
            } 
            else {
                echo "gagal";
                echo mysqli_error($db_link);
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
       
            $id_pegawai=$_POST['id_pegawai'];

            $edit="select a.*,b.nama from pendukung a 
            left join pegawai b on b.no_pegawai = a.id_pegawai 
            where a.id_pegawai='$id_pegawai'";
             
            $hasil = mysqli_query($db_link,$edit);
            
            $row=mysqli_fetch_assoc($hasil);

            unlink("../../upload/".str_replace(" ","_",$row['file_pendukung'])); 
            
            $sql_delete = "DELETE from pendukung where id_pegawai='$id_pegawai'";
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
