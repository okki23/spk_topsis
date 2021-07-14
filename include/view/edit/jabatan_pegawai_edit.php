 <?php
            $id_jabatan=$_GET['id_jabatan'];
            $edit=("select * from jabatan_pegawai where id_jabatan='$id_jabatan'");
            $hasil = mysqli_query($db_link,$edit);
            $row=mysqli_fetch_array($hasil);

             $pegawai=("SELECT A.no_pegawai,A.nama from pegawai A
                 ");
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
            <div class="panel-heading"><h2 class="text-center">UBAH JABATAN PEGAWAI</h2></div>
                <div class="panel-body">
           
               <form class="form-horizontal">
                    <div class="form-group">
                        <input type="hidden" name="id_jabatan" value="<?php echo $id_jabatan;?>"/>
                                
                        <label class="control-label col-sm-4" for="name">No Pegawai : </label>
                         <div class="col-sm-6">
                            <select  class="form-control" name="pegawai" id="pegawai">  
                                    <?php
                                       while ($pegawai_tampil=mysqli_fetch_assoc($pegawai_query)){
                                           echo "<option value='".$pegawai_tampil['no_pegawai']."'";
                                           if ($row['id_pegawai']==$pegawai_tampil['no_pegawai']) echo "selected='selected'";
                                           echo ">".$pegawai_tampil['no_pegawai']." - ".$pegawai_tampil['nama']."</option>";
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
                                        echo "<option value='".$unit_kerja_tampil['id_unit_kerja']."'";
                                        if ($row['id_unit_kerja']==$unit_kerja_tampil['id_unit_kerja']) echo "selected='selected'";
                                        echo ">".$unit_kerja_tampil['nama_unit_kerja']."</option>";
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
                                        echo "<option value='".$bagian_tampil['id_bagian']."'";
                                        if ($row['id_bagian']==$bagian_tampil['id_bagian']) echo "selected='selected'";
                                        echo ">".$bagian_tampil['bagian']."</option>";
                                    }
                                ?>
                            </select> 
                        </div>
                    </div>
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
                            <label class="control-label col-sm-4" for="status">Status : </label>
                            <div class="col-sm-6">
                                 <select  class="form-control" name="status" id="status">  
                                   <option value="1"  <?php   if ($row['Status']==1) echo "selected='selected'"; ?>>Aktif</option>
                                   <option value="0"  <?php   if ($row['Status']==0) echo "selected='selected'"; ?>>Tidak Aktif</option>
                                </select> 
                            </div>
                    </div>
                    <div class="form-group">
                            <label class="control-label col-sm-4" for="tgl_jabat">TANGGAL JABAT :</label>
                            <div class="col-sm-6">
                                <div class='input-group date datetimepicker1'>
                                    <input type="text" class="form-control" id="tgl_jabat" name="tgl_jabat" placeholder="Tanggal Jabat" value="<?php echo $row['tgl_jabat']; ?>">
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
					<button type="button" id="simpan" class="btn btn-success">SIMPAN</button>
                    <button type="button" id="cancel" onclick="window.location ='index.php?navigasi=jabatan_pegawai&crud=view';" class="btn btn-danger">CANCEL</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="../vendor/jquery/jquery.min.js"></script>
<script>
 $(document).ready(function () {
          $("#simpan").click(function () {
            var id_jabatan = $('input[name=id_jabatan]').val();
            var id_pegawai = $('select[name=pegawai]').val();
            var id_unit_kerja= $('select[name=unit_kerja]').val();
            var id_bagian= $('select[name=bagian]').val();
            var jabatan= $('select[name=jabatan]').val();
            var status= $('select[name=status]').val();
            var tgl_jabat= $('input[name=tgl_jabat]').val();
            $.ajax({
              type: "POST",
              url: "../include/kontrol/kontrol_jabatan_pegawai.php",
             data: 'crud=update&id_jabatan='+id_jabatan+
                    '&id_pegawai=' +id_pegawai+
                    '&id_unit_kerja=' +id_unit_kerja+
                    '&id_bagian='+id_bagian+
                    '&jabatan='+jabatan+
                    '&status='+status+
                    '&tgl_jabat='+tgl_jabat,
              success: function (respons) {
                  if (respons=='berhasil'){
                        $('#pesan_berhasil').text("Jabatan Pegawai Berhasil Dirubah");
                        $("#hasil").show();
                        setTimeout(function(){
                            $("#hasil").hide(); 
                        }, 2000);
                  }
                  else {
                        $('#pesan_gagal').text("Jabatan Pegawai Gagal Dirubah");
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