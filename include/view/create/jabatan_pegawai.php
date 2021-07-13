 <?php
    $pegawai=("SELECT A.no_pegawai,A.nama from pegawai A
        LEFT JOIN jabatan_pegawai B ON A.no_pegawai=B.id_pegawai
        WHERE B.id_pegawai IS NULL ");
    $pegawai_query = mysqli_query($db_link,$pegawai);
    $unit_kerja=("SELECT A.id_unit_kerja,A.nama_unit_kerja from unit_kerja A
        ");
    $unit_kerja_query = mysqli_query($db_link,$unit_kerja);
     $bagian=("SELECT A.id_bagian,A.bagian from bagian A
       ");
    $bagian_query = mysqli_query($db_link,$bagian);
            
?>


<div class="col-sm-6 col-sm-offset-4">  
	<div class="panel-group">
		<div class="panel panel-primary">
            <div class="panel-heading"><h2 class="text-center">TAMBAH JABATAN PEGAWAI</h2></div>
                <div class="panel-body">
                    <form class="form-horizontal">
                        <div class="form-group" id="pegawai">
                            <label class="control-label col-sm-4" for="pegawai">NO PEGAWAI : </label>
                            <div class="col-sm-6">
                                 <select  class="form-control" name="pegawai" id="pegawai">  
                                    <?php
                                       while ($pegawai_tampil=mysqli_fetch_assoc($pegawai_query)){
                                           echo "<option value='".$pegawai_tampil['no_pegawai']."'>".$pegawai_tampil['no_pegawai']." - ".$pegawai_tampil['nama']."</option>";
                                       }
                                    ?>
                                </select> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="unit_kerja">Unit Kerja : </label>
                            <div class="col-sm-6">
                                 <select  class="form-control" name="unit_kerja" id="unit_kerja">  
                                    <?php
                                       while ($unit_kerja_tampil=mysqli_fetch_assoc($unit_kerja_query)){
                                           echo "<option value='".$unit_kerja_tampil['id_unit_kerja']."'>".$unit_kerja_tampil['nama_unit_kerja']."</option>";
                                       }
                                    ?>
                                </select> 
                            </div>
                        </div>
                    
                    <div class="form-group">
                            <label class="control-label col-sm-4" for="bagian">Bagian : </label>
                            <div class="col-sm-6">
                                 <select  class="form-control" name="bagian" id="bagian">  
                                    <?php
                                       while ($bagian_tampil=mysqli_fetch_assoc($bagian_query)){
                                           echo "<option value='".$bagian_tampil['id_bagian']."'>".$bagian_tampil['bagian']."</option>";
                                       }
                                    ?>
                                </select> 
                            </div>
                        </div>
                   
                    <div class="form-group">
                            <label class="control-label col-sm-4" for="jabatan">Jabatan : </label>
                            <div class="col-sm-6">
                                 <select  class="form-control" name="jabatan" id="jabatan">  
                                   <option value="Admin">Admin</option>
                                   <option value="Kapus">Kapus</option>
                                   <option value="Kabag">Kabag</option>
                                   <option value="Pegawai">Pegawai</option>
                                </select> 
                            </div>
                        </div>
                    
                    <div class="form-group">
                            <label class="control-label col-sm-4" for="status">Status : </label>
                            <div class="col-sm-6">
                                 <select  class="form-control" name="status" id="status">  
                                   <option value="1">Aktif</option>
                                   <option value="0">Tidak Aktif</option>
                                </select> 
                            </div>
                    </div>
                     <div class="form-group">
                            <label class="control-label col-sm-4" for="tgl_jabat">TANGGAL JABAT :</label>
                            <div class="col-sm-6">
                                <div class='input-group date datetimepicker1'>
                                    <input type="text" class="form-control" id="tgl_jabat" name="tgl_jabat" placeholder="Tanggal Jabat" >
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                </form>
                </div>
			<hr style="height:1px; border:none;margin:0; color:#000; background-color:#428bca;">
			<div class="panel-footer">
				<div class="text-center">	
					<button type="sumbit" id="tambah" class="btn btn-success">SIMPAN</button>
                    <button type="button" id="cancel" onclick="window.location ='index.php?navigasi=jabatan_pegawai&crud=view';" class="btn btn-danger">CANCEL</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="../vendor/jquery/jquery.min.js"></script>
<script>
 
 $(document).ready(function () {
      
          $("#tambah").click(function () {
            var id_pegawai = $('select[name=pegawai]').val();
            var id_unit_kerja= $('select[name=unit_kerja]').val();
            var id_bagian= $('select[name=bagian]').val();
            var jabatan= $('select[name=jabatan]').val();
            var status= $('select[name=status]').val();
            var tgl_jabat= $('input[name=tgl_jabat]').val();
            $.ajax({
              type: "POST",
              url: "../include/kontrol/kontrol_jabatan_pegawai.php",
              data: 'crud=tambah&id_pegawai=' +id_pegawai+
                    '&id_unit_kerja=' +id_unit_kerja+
                    '&id_bagian='+id_bagian+
                    '&jabatan='+jabatan+
                    '&status='+status+
                    '&tgl_jabat='+tgl_jabat,
              success: function (respons) {
                  if (respons=='berhasil'){
                         $('#pesan_berhasil').text("Jabatan Berhasil Ditambah");
                        $("#hasil").show();
                        setTimeout(function(){
                            $("#hasil").hide(); 
                        }, 2000);
                  }
                  else {
                        $('#pesan_gagal').text("Jabatan Gagal Ditambah");
                        $("#gagal").show();
                        setTimeout(function(){
                            $("#gagal").hide(); 
                        }, 2000);

                  }
              }
            });
          });
         $(function () {
                $('.datetimepicker1').datetimepicker({
                viewMode: 'years',
                format: 'DD/MM/YYYY'
            }
                );
            });
      });
      
</script>

<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">