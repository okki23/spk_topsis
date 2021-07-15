<?php
include_once "../../koneksi.php";

  if (isset($_POST['crud'])){
$hasil='';
        if($_POST['crud']=='tambah'){
           $b=1;
           $count=$_POST['count'];
           $no_peg=array();
            $nama_peg=array();
            $unit_kerja=array();
            $nilai_kerja=array();
            $bagian=array();
            $jabatan_peg=array();
            $tgl_rangking=array();
            // echo $count;
            // die();

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
            // die();
        //     while($b<=$count){
        //          $no_peg[$b]=$_POST["no_peg$b"];
        //          $nama_peg[$b]=$_POST["nama_peg$b"];
        //          $unit_kerja[$b]=$_POST["unit_kerja$b"];
        //          $nilai_kerja[$b]=$_POST["nilai_kerja$b"];
        //          $bagian[$b]=$_POST["bagian$b"];
        //          $jabatan_peg[$b]=$_POST["jabatan_peg$b"];
        //          $tgl_rangking[$b]=$_POST["tgl_rangking$b"];
        //        $usulan="INSERT INTO usulan(no_pegawai,nama_pegawai,nama_unit_kerja,nilai,bagian,jabatan,periode)
        //        VALUES ('$no_peg[$b]','$nama_peg[$b]','$unit_kerja[$b]',$nilai_kerja[$b],'$bagian[$b]','$jabatan_peg[$b]','".$tgl_rangking[$b]."')";
        //         $hasil = mysqli_query($db_link,$usulan); 
        //         echo mysqli_error($db_link);
        //    $b++;
        //     }
        
            
            
            if ($hasil) {
                echo "berhasil";
            } 
            else {
                
                echo "gagal";
                echo mysqli_error($db_link);
            }
        }

        if($_POST['crud']=='hapus'){
           $id_usulan = $_POST['id_usulan'];
            $sql_delete = "DELETE from usulan where id_usulan='$id_usulan'";
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
?>
