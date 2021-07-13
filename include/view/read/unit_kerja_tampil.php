


<div class="col-sm-8 col-sm-offset-3">  
	<h2 class="text-center">DAFTAR UNIT KERJA</h2> 
	<div class="panel-group">
		<div class="panel panel-default">
			<table class="table table-bordered table-hover text-center panel panel-primary"  id="example">
				<thead class="panel-heading">
					<tr>
						<th class="text-center">Nama Unit Kerja</th>
						<th class="text-center">Alamat Unit Kerja</th>
						<th class="text-center">Aksi</th>
					</tr>
				</thead>
				<tbody>
					<?php /*php pembuka tabel atas*/
							$sql = "select * from unit_kerja order by id_unit_kerja";
							$hasil = mysqli_query($db_link,$sql);
							if (!$hasil){
							die("Gagal Query Data ");}
							
							while ($data=mysqli_fetch_array($hasil)) {
							echo "<tr>";
                            echo "  <td>{$data['nama_unit_kerja']}</td>
                                    <td>{$data['alamat_unit_kerja']}</td>
									<td>";
									 if($hak_akses==0 || $hak_akses==2  ){
										echo "	<a class='btn btn-primary ubah' ref='".$data['id_unit_kerja']."'>Ubah</a>
										<a class='btn btn-danger hapus' ref='".$data['id_unit_kerja']."' nama='".$data['nama_unit_kerja']."'>Hapus</a>&nbsp;";
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
						<?php
						 if($hak_akses==0 || $hak_akses==2  ){
							echo '<button type="button" id="tambah" class="btn btn-success">TAMBAH UNIT KERJA</button>';
						}
						?>
						<button class="btn btn-primary hidden-print" onclick="printJS('../pdf/print_unit_kerja.php')">
						<span class="glyphicon glyphicon-print" aria-hidden="true"></span> Print</button>
	
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
           		window.location.replace("index.php?navigasi=unit_kerja&crud=tambah");
          });
		
		$('.ubah').click(function() {
				var id_unit_kerja=$(this).attr('ref');
			 window.location.replace("index.php?navigasi=unit_kerja&crud=edit&id_unit_kerja="+id_unit_kerja);
		});

		$('.hapus').click(function() {
    		var id_unit_kerja =$(this).attr('ref');
			var nama_unit_kerja=$(this).attr('nama');
			 if (confirm('Yakin menghapus unit_kerja '+nama_unit_kerja+'????')) {
					$.ajax({
					type: "POST",
					url: "../include/kontrol/kontrol_unit_kerja.php",
					data: 'crud=hapus&id_unit_kerja='+id_unit_kerja,
					success: function (respons) {
						
						console.log(respons);
						if (respons=='berhasil'){
							$('#pesan_berhasil').text("unit_kerja Berhasil Dihapus");
								$("#hasil").show();
								setTimeout(function(){
									$("#hasil").hide();
									window.location.reload(1);
								}, 2000);
						}

						else {
								$('#pesan_gagal').text("unit_kerja Gagal Dihapus");
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