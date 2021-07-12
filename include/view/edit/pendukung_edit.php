<?php
            $id_pegawai=$_GET['id_pegawai'];

            $edit="select a.*,b.nama from pendukung a 
            left join pegawai b on b.no_pegawai = a.id_pegawai 
            where a.id_pegawai='$id_pegawai'";
             
            $hasil = mysqli_query($db_link,$edit);
            
            $row=mysqli_fetch_assoc($hasil);
            // echo $row['file_pendukung'];
            

            $res_file = '';
            if($row['file_pendukung'] == NULL || $row['file_pendukung'] == ''){
                $res_file = 'Belum Ada'; 
            }else{
                $res_file = $row['file_pendukung'];
                // $res_file = "<a href='../../upload/'".$row['file_pendukung']."'> Buka File</a>"; 
            }
 
            
			$pegawai=("SELECT A.no_pegawai,A.nama, B.id_pegawai from pegawai A
            LEFT JOIN jabatan_pegawai B ON A.no_pegawai=B.id_pegawai WHERE B.id_pegawai='".$id_pegawai."'");
            $pegawai_query = mysqli_query($db_link,$pegawai);
?>

<div class="col-sm-6 col-sm-offset-4">  
	<div class="panel-group">
		<div class="panel panel-primary">
            <div class="panel-heading"><h2 class="text-center">UBAH PEGAWAI </h2></div>
          
                <div class="panel-body">
                <form method="post" id="user_form" enctype="multipart/form-data">   
                    <div class="form-group">
                        <input type="hidden" name="id_pegawai" value="<?php echo $id_pegawai;?>"/>
                        <input type="hidden" name="crud" id="crud" value="update">
                        <label class="control-label col-sm-3" for="name">No Pegawai </label>
                         <div class="col-sm-8">
                            <select  class="form-control" name="id_pegawai" id="id_pegawai" >  
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
											
                    <div class="form-group" id="nama_group">
                            <label class="control-label col-sm-3" for="nama_kegiatan">Nama Kegiatan</label>
                            <div class="col-sm-8">
                            <input type="text" class="form-control" id="nama_kegiatan" name="nama_kegiatan" value="<?php echo $row['nama_kegiatan']; ?>" require/>
                            </div>
                        </div> 
                       
                            <div class="form-group" style="margin-left:120px;">
                                <!-- <label class="control-label col-sm-3">File :</label> -->
                                <div class="col-sm-8">   
                                <h5> <b> Upload File </b></h5>
                                <?php echo '<a target="_blank" href=../upload/'.$res_file.'> Buka File </a>'; ?>
                                <input type="file" class="form-control" id="file" name="file"/>
                                </div>
                            </div>
                        
                </form>
             </div>
			<hr style="height:1px; border:none;margin:0; color:#000; background-color:#428bca;">
			<div class="panel-footer">
				<div class="text-center">	
					<button type="button" id="simpan" class="btn btn-success">SIMPAN</button>
                    <button type="button" id="cancel" onclick="window.location ='index.php?navigasi=pendukung&crud=view';" class="btn btn-danger">CANCEL</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="../vendor/jquery/jquery.min.js"></script>
<script>
 $(document).ready(function () {
          $("#simpan").click(function () {
            var id_pegawai = $("#id_pegawai").val();
            var nama_kegiatan = $("#nama_kegiatan").val();
            var file = $('#file').val();
            var crud = $("#crud").val();

            var formData = new FormData($('#user_form')[0]);   
            var extension = $('#file').val().split('.').pop().toLowerCase();  
 
            $.ajax({
                url: "../include/kontrol/kontrol_pendukung.php",
                type:"POST",
                data:formData,
                contentType:false,  
                processData:false,   
                success:function(result){ 
                if (result=='berhasil'){
                         $('#pesan_berhasil').text("Pendukung Berhasil Dirubah");
                        $("#hasil").show();
                        $('#user_form')[0].reset();
                        setTimeout(function(){
                            $("#hasil").hide(); 
                        }, 2000);
                }else {
                        $('#pesan_gagal').text("Pendukung Gagal Dirubah");
                        $("#gagal").show();
                        $('#user_form')[0].reset();
                        setTimeout(function(){
                            $("#gagal").hide(); 
                        }, 2000);

                }
                }
            }); 
        
          });
      });
</script>