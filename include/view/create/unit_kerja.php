<div class="col-sm-6 col-sm-offset-4">  
	<div class="panel-group">
		<div class="panel panel-primary">
            <div class="panel-heading"><h2 class="text-center">TAMBAH UNIT KERJA</h2></div>
                <div class="panel-body">
                    <form class="form-horizontal">
                        <div class="form-group" id="nama_group">
                            <label class="control-label col-sm-3" for="nama_unit_kerja">Nama Unit Kerja:</label>
                            <div class="col-sm-8">
                            <input type="text" class="form-control" id="nama_unit_kerja" name="nama_unit_kerja" placeholder="Nama Unit Kerja" require/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="alamat_unit_kerja">Alamat Unit Kerja:</label>
                            <div class="col-sm-8"> 
                            <textarea class="form-control" rows="" name="alamat_unit_kerja"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
			<hr style="height:1px; border:none;margin:0; color:#000; background-color:#428bca;">
			<div class="panel-footer">
				<div class="text-center">	
					<button type="sumbit" id="tambah" class="btn btn-success">SIMPAN</button>
                    <button type="button" id="cancel" onclick="window.location ='index.php?navigasi=unit_kerja&crud=view';" class="btn btn-danger">CANCEL</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="../vendor/jquery/jquery.min.js"></script>
<script>
 
 $(document).ready(function () {
      
          $("#tambah").click(function () {
            
            var nama_unit_kerja = $('input[name=nama_unit_kerja]').val();
            var alamat_unit_kerja= $('textarea[name=alamat_unit_kerja]').val();
            if (nama_unit_kerja=='' || nama_unit_kerja==null) {

                $("#nama_group").addClass("form-group has-error has-feedback");
                $("#nama_unit_kerja").after("<span class='glyphicon glyphicon-remove form-control-feedback'></span>");
                 $('#pesan_required').text("Nama Tidak Boleh Kosong");
                  $("#required").show();
                }
               
            else{
            $.ajax({
              type: "POST",
              url: "../include/kontrol/kontrol_unit_kerja.php",
              data: 'crud=tambah&nama_unit_kerja=' + nama_unit_kerja + '&alamat_unit_kerja=' +alamat_unit_kerja,
              success: function (respons) {
                  if (respons=='berhasil'){
                         $('#pesan_berhasil').text("Unit Kerja Berhasil Ditambah");
                        $("#hasil").show();
                        setTimeout(function(){
                            $("#hasil").hide(); 
                        }, 2000);
                  }
                  else {
                        $('#pesan_gagal').text("Unit Kerja Gagal Ditambah");
                        $("#gagal").show();
                        setTimeout(function(){
                            $("#gagal").hide(); 
                        }, 2000);

                  }
              }
            });
            }
          });
      });
      
</script>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">