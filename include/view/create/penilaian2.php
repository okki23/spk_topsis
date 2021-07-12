 <?php
 error_reporting(0);
    include_once "../../../koneksi.php";
    $id_jabatan=$_GET['id_jabatan'];
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

    $sqlrek = " select a.*,b.nama from pendukung a 
    left join pegawai b on b.no_pegawai = a.id_pegawai
   left join jabatan_pegawai c on c.id_pegawai = a.id_pegawai
       where c.id_jabatan = '".$id_jabatan."' ";
    $exrek = mysqli_query($db_link,$sqlrek);
    $datarek = mysqli_fetch_assoc($exrek); 
    
    $res_nk = '';
    $res_fk = '';
    if($datarek['nama_kegiatan'] != NULL || $datarek['nama_kegiatan'] != ''){
        $res_nk = $datarek['nama_kegiatan'];
    }else{
        $res_nk = ' - '; 
    }

    if($datarek['file_pendukung'] != NULL || $datarek['file_pendukung'] != ''){ 
        $res_fk = '<a href="http://localhost/spk_topsis/upload/'.$datarek['file_pendukung'].'" target="_blank"> Download File </a>';
    }else{
        $res_fk = ' - ';
    }

    echo "<br> <div align='center'> <h3> <b> Nama Kegiatan : ".$res_nk." </b> </h3> <br> <h3> <b> File Pendukung : ".$res_fk." </b> </h3> </div> <br> &nbsp;";
?>
<script src="../vendor/jquery/jquery.min.js"></script>
<script>
   var penilaiancount=<?php echo $b; ?>;
          

</script>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">