<?php
Class Model_pdf extends CI_Model{
	
	function data_pdf() {
        $this->db->select("DATE_FORMAT(a.tgl, '%d-%m-%Y') AS tgl, a.waktu AS jam_masuk, (SELECT waktu FROM absensi al WHERE al.tgl = a.tgl AND id_user = '6' AND al.keterangan != a.keterangan) AS jam_pulang");
        $this->db->where('id_user', $id_user);
        $this->db->where("DATE_FORMAT(tgl, '%m') = ", $bulan);
        $this->db->where("DATE_FORMAT(tgl, '%Y') = ", $tahun);
        $this->db->group_by("tgl");
		$data_absen = $this->db->get('absensi a');
		return $data_absen->result();
	}
}
?>