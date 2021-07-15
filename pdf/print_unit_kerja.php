<?php // ob_start(); ?>
<html>
<head>
	<title>Aplikasi Penilaian Pegawai Terbaik, Pusat Pengembangan Talenta, BPSDM, PUPR</title>
</head>
<body>
	
<h3 style="text-align: center;">DAFTAR UNIT KERJA</h3>

<table border="1" align="center">
<tr>
	<th>Nama Unit Kerja</th>
	<th>Alamat Unit Kerja</th>
</tr>
<?php
// Load file koneksi.php
include "../koneksi.php";
 
$query = "SELECT * FROM unit_kerja";
$sql = mysqli_query($db_link, $query);
$row = mysqli_num_rows($sql);
 
 
if($row > 0){ 

    while($data = mysqli_fetch_array($sql)){ 
        echo "<tr>";
        echo "<td>".$data['nama_unit_kerja']."</td>";
        echo "<td>".$data['alamat_unit_kerja']."</td>";
        echo "</tr>";
    }
}else{
    echo "<tr><td colspan='4'>Data Bagian tidak ada</td></tr>";
}
?>
</table>

</body>
</html>
<?php
/*
$html = ob_get_contents();
ob_end_clean();
        
require_once('html2pdf/html2pdf.class.php');
$pdf = new HTML2PDF('P','A4','en');
$pdf->WriteHTML($html);
$pdf->Output('Data unit_kerja.pdf', 'D');*/
?>
