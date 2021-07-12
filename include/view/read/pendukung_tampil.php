<div class="col-sm-8 col-sm-offset-3">  
	<h2 class="text-center">DAFTAR Pendukung</h2> 
	<div class="panel-group">
		<div class="panel panel-default">
			<table class="table table-bordered table-hover text-center panel panel-primary" id="example">
				<thead class="panel-heading">
					<tr>
						<th class="text-center">No Pegawai</th>
						<th class="text-center">Kegiatan</th>
						<th class="text-center">File</th>
						<th class="text-center">Aksi</th>
					</tr>
				</thead>
				<tbody>
					<?php /*php pembuka tabel atas*/
							$sql = "select * from pendukung order by id";
							$hasil = mysqli_query($db_link,$sql);
							if (!$hasil){
							die("Gagal Query Data ");}
							
							while ($data=mysqli_fetch_array($hasil)) {
							echo "<tr>";
                            echo "  <td>{$data['id_pegawai']}</td>
									<td>{$data['pendukung_name']}</td>
									<td>";
									if($data['hak_akses']==0){
										echo "Admin";
									}
									else if($data['hak_akses']==1){
										echo "Manager";
									}
									else if($data['hak_akses']==2){
										echo "HRD";
									}
									else if($data['hak_akses']==3){
										echo "Koordinator";
									}
									else if($data['hak_akses']==4){
										echo "Pegawai";
									}
									echo "</td>
									<td>
										  <a class='btn btn-primary ubah' ref='".$data['id_pegawai']."'>Ubah</a>&nbsp;";
									if ($data['hak_akses']<>0){
										echo "<a class='btn btn-danger hapus' ref='".$data['id_pegawai']."' nama='".$data['pendukung_name']."'>Hapus</a>";
									}
                                    echo "</td>";
							echo "</tr>";
						}
					?>
				</tbody>
			</table>
						<hr style="height:2px; border:none;margin:0; color:#000; background-color:#428bca;">
			<div class="panel-heading">
					<div class="row">
						<div class="col-sm-12">
							<button type="button" id="tambah" class="btn btn-success">TAMBAH pendukung</button>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>

<script src="../vendor/jquery/jquery.min.js"></script>

<script>
	 $(document).ready(function () {
		$('#example').DataTable();
        $("#tambah").click(function () {
           		window.location.replace("index.php?navigasi=pendukung&crud=tambah");
          });
		
		$('.ubah').click(function() {
				var id_pegawai=$(this).attr('ref');
			 window.location.replace("index.php?navigasi=pendukung&crud=edit&id_pegawai="+id_pegawai);
		});

		$('.hapus').click(function() {
    		var id_pegawai =$(this).attr('ref');
			var pendukungname=$(this).attr('nama');
			 if (confirm('Yakin menghapus pendukung '+id_pegawai+'????')) {
					$.ajax({
					type: "POST",
					url: "../include/kontrol/kontrol_pendukung.php",
					data: 'crud=hapus&id_pegawai='+id_pegawai+'&pendukungname='+pendukungname,
					success: function (respons) {
						
						console.log(respons);
						if (respons=='berhasil'){
							$('#pesan_berhasil').text("pendukung Berhasil Dihapus");
								$("#hasil").show();
								setTimeout(function(){
									$("#hasil").hide();
									window.location.reload(1);
								}, 2000);
						}

						else {
								$('#pesan_gagal').text("pendukung Gagal Dihapus");
								$("#gagal").show();
								setTimeout(function(){
									$("#gagal").hide(); 
									window.location.reload(1);
								}, 2000);
							
						}
					}
					});
			 }
			
		});
		 
	 });
</script>