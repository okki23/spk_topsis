 <?php
    $kriteria=("SELECT id_kriteria,nama_kriteria FROM kriteria");
    $kriteria_query = mysqli_query($db_link,$kriteria);
    
    $id_bobot=$_GET['id_bobot'];
     $edit=("select A.*,B.id_kriteria,B.bobot from bobot_penilaian A 
     INNER JOIN detail_bobot B ON A.id_bobot=B.id_bobot where A.id_bobot=$id_bobot");
        $hasil = mysqli_query($db_link,$edit);
        $row=mysqli_fetch_assoc($hasil);

?>


<div class="col-sm-6 col-sm-offset-4">  
	<div class="panel-group">
		<div class="panel panel-primary">
            <div class="panel-heading"><h2 class="text-center">UBAH BOBOT PENILAIAN</h2></div>
                <div class="panel-body">
                    <form class="form-horizontal">
                   
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="jabatan">Jabatan : </label>
                        <div class="col-sm-6">
                                <select  class="form-control" name="jabatan" id="jabatan">  
                                <option value="Admin" <?php   if ($row['jabatan']=='Admin') echo "selected='selected'"; ?>>Admin</option>
                                <option value="Kapus" <?php if ($row['jabatan']=='Kapus') echo "selected='selected'"; ?>>Kapus</option>
                                <option value="Kabag" <?php if ($row['jabatan']=='Kabag') echo "selected='selected'"; ?>>Kabag</option>
                                <option value="Pegawai" <?php if ($row['jabatan']=='Pegawai') echo "selected='selected'"; ?>>Pegawai</option>
                            </select> 
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="tgl_jabat">Bobot Kriteria :</label>
                    </div>
                    <?php
                        $b=1;

                        while ($kriteria_tampil=mysqli_fetch_assoc($kriteria_query)){
                             $edit_bobot=("select B.id_kriteria,BB.bobot from bobot_penilaian A
                             INNER JOIN detail_bobot BB ON A.id_bobot=BB.id_bobot
                                LEFT JOIN kriteria B ON BB.id_kriteria=B.id_kriteria
                                where A.id_bobot='$id_bobot'
                                AND B.id_kriteria='".$kriteria_tampil['id_kriteria']."'");
                                $hasil_bobot = mysqli_query($db_link,$edit_bobot);
                                $row_bobot=mysqli_fetch_assoc($hasil_bobot);
                            echo '
                             <div class="form-group">
                            <label class="control-label col-sm-4 col-sm-offset-1" for="bobot">'.$kriteria_tampil["nama_kriteria"].' : </label>
                            <div class="col-sm-3">
                                    <input type="hidden" class="form-control" id="bobot" name="kriteria'.$b.'" value="'.$kriteria_tampil["id_kriteria"].'" >
                                    <input type="text" class="form-control" id="bobot" name="bobot'.$b.'" placeholder="BOBOT" value="'.$row_bobot['bobot'].'" >
                            </div>
                            </div>   ';
                        $b++;
                        }
                    ?>
                   </form>   
                </div>
			<hr style="height:1px; border:none;margin:0; color:#000; background-color:#428bca;">
			<div class="panel-footer">
				<div class="text-center">	
					<button type="sumbit" id="tambah" class="btn btn-success">SIMPAN</button>
                    <button type="button" id="cancel" onclick="window.location ='index.php?navigasi=bobot_penilaian&crud=view';" class="btn btn-danger">CANCEL</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="../vendor/jquery/jquery.min.js"></script>

<script>
 $(document).ready(function () {
        var bobotcount=<?php echo $b; ?>;
            bobotcount=bobotcount-1;
          $("#tambah").click(function () {
            var id_bobot='<?php echo $id_bobot;?>';
            var bagian ='<?php echo $row['id_bagian']; ?>';
            var jabatan= $('select[name=jabatan]').val();
            var count=1;
            var bobot=[];
            var bobotstring='';
            var kriteria=[];
            var kriteriastring='';
        while (count<=bobotcount){
            bobot[count]=$('input[name=bobot'+count+']').val();
            bobotstring=bobotstring+'&bobot'+count+'='+bobot[count];

            kriteria[count]=$('input[name=kriteria'+count+']').val();
            kriteriastring=kriteriastring+'&kriteria'+count+'='+kriteria[count];
            count++;
        }
            
            $.ajax({
              type: "POST",
              url: "../include/kontrol/kontrol_bobot_penilaian.php",
              data: 'crud=update&count='+bobotcount+
                    '&id_bobot='+id_bobot+
                    '&bagian=' +bagian+
                    '&jabatan='+jabatan+
                    bobotstring+kriteriastring,
              success: function (respons) {
                  if (respons=='berhasil'){
                         $('#pesan_berhasil').text("Bobot Penilaian Berhasil Ditambah");
                        $("#hasil").show();
                        setTimeout(function(){
                            $("#hasil").hide(); 
                        }, 2000);
                  }
                  else {
                        $('#pesan_gagal').text("Bobot Penilaian Gagal Ditambah");
                        $("#gagal").show();
                        setTimeout(function(){
                            $("#gagal").hide(); 
                        }, 2000);

                  }
              }
              
            });
          });
      });
      
</script>