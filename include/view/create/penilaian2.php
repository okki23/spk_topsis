 <?php
 error_reporting(0);
    include_once "../../../koneksi.php";
    $id_jabatan=$_GET['id_jabatan'];  
    
    $sqlrek = "select a.*,b.nama from pendukung a 
    left join pegawai b on b.no_pegawai = a.id_pegawai
    left join jabatan_pegawai c on c.id_pegawai = a.id_pegawai
    where c.id_jabatan = '".$id_jabatan."' ";
    $exrek = mysqli_query($db_link,$sqlrek); 
    // $datas = mysqli_fetch_array($exrek);
    $cekdata = mysqli_num_rows($exrek);

    if($cekdata > 0){
        $no = 1;
        echo '<table class="table table-bordered table-hover text-center panel panel-primary" id="example">
                <tr>
                <td> No </td>
                <td> Nama Berkas Pendukung </td>
                <td> File Pendukung </td>
                </tr>
        ';
      
        while($datarek = mysqli_fetch_array($exrek)){ 
    
        if($datarek['file_pendukung'] != NULL || $datarek['file_pendukung'] != ''){ 
            $res_fk = '<a href="http://localhost/spk_topsis/upload/'.$datarek['file_pendukung'].'" target="_blank"> Download File </a>';
        }else{
            $res_fk = ' - ';
        }
    
        echo "<tr> 
                    <td>".$no."</td>
                    <td>".$datarek['nama_kegiatan']."</td>
    
                    <td>".$res_fk."</td>
                    </tr>
                    ";
        $no++;
        }
        echo "</table> <br> &nbsp;";
    }else{
        // echo 'gada';
        echo '<table class="table table-bordered table-hover text-center panel panel-primary" id="example">
        <tr>
        <td> No </td>
        <td> Nama Berkas Pendukung </td>
        <td> File Pendukung </td>
        </tr>

        <tr>
        <td colspan="3"> Tidak ada data </td> 
        </tr>
        </table> <br> &nbsp; ';
    }

    

    $sqlrek = " select a.*,b.nama from pendukung a 
    left join pegawai b on b.no_pegawai = a.id_pegawai
    left join jabatan_pegawai c on c.id_pegawai = a.id_pegawai
    where c.id_jabatan = '".$id_jabatan."' ";
    $exrek = mysqli_query($db_link,$sqlrek);
 
    $kriteria=("SELECT DISTINCT DD.id_detailbobot,D.nama_kriteria FROM bagian A
                INNER JOIN jabatan_pegawai B ON A.id_bagian=B.id_bagian
                INNER JOIN bobot_penilaian C ON A.id_bagian=C.id_bagian AND B.jabatan=C.jabatan
                INNER JOIN detail_bobot DD On C.id_bobot=DD.id_bobot
                INNER JOIN kriteria D ON DD.id_kriteria=D.id_kriteria   
                WHERE B.id_jabatan='".$id_jabatan."'
                AND C.status=1");
    $kriteria_query = mysqli_query($db_link,$kriteria);
    echo mysqli_error($db_link);
    $b=1;
    while ($kriteria_tampil=mysqli_fetch_assoc($kriteria_query)){
        echo '
            <div class="form-group">
            <label class="control-label col-sm-4 col-sm-offset-1" for="bobot">'.$kriteria_tampil["nama_kriteria"].' : </label>
            <div class="col-sm-3" >
                <input type="hidden" class="form-control" id="bobot" name="bobot'.$b.'" value="'.$kriteria_tampil["id_detailbobot"].'" >
                <input type="number" min="0" max="100" class="form-control" id="penilaian" name="penilaian'.$b.'" placeholder="PENILAIAN" >
            </div>
        </div>  
        ';
    $b++;
    }

?>
<script src="../vendor/jquery/jquery.min.js"></script>
<script>
   var penilaiancount=<?php echo $b; ?>;
          

</script>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">