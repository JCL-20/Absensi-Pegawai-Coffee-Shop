<?php
defined('BASEPATH') OR die('No direct script access allowed!');

class Absensi extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_login();
        date_default_timezone_set('Asia/Jakarta');
        $this->load->model('Absensi_model', 'absensi');
        $this->load->model('Karyawan_model', 'karyawan');
        $this->load->model('Jam_model', 'jam');
        $this->load->helper('Tanggal');
    }

    public function index()
    {
        if (is_level('Karyawan')) {
            return $this->detail_absensi();
        } else {
            return $this->list_karyawan();
        }
    }

    public function list_karyawan()
    {
        $data['karyawan'] = $this->karyawan->get_all();
        return $this->template->load('template', 'absensi/list_karyawan', $data);
    }

    public function detail_absensi()
    {
        $data = $this->detail_data_absen();
        return $this->template->load('template', 'absensi/detail', $data);
    }

    public function check_absen()
    {
        $now = date('H:i:s');
        $data['absen'] = $this->absensi->absen_harian_user($this->session->id_user)->num_rows();
        return $this->template->load('template', 'absensi/absen', $data);
    }

    public function absen()
    {
        if (@$this->uri->segment(3)) {
            $keterangan = ucfirst($this->uri->segment(3));
        } else {
            $absen_harian = $this->absensi->absen_harian_user($this->session->id_user)->num_rows();
            $keterangan = ($absen_harian < 2 && $absen_harian < 1) ? 'Masuk' : 'Pulang';
        }

        $data = [
            'tgl' => date('Y-m-d'),
            'waktu' => date('H:i:s'),
            'keterangan' => $keterangan,
            'id_user' => $this->session->id_user
        ];
        $result = $this->absensi->insert_data($data);
        if ($result) {
            $this->session->set_flashdata('response', [
                'status' => 'success',
                'message' => 'Absensi berhasil dicatat'
            ]);
        } else {
            $this->session->set_flashdata('response', [
                'status' => 'error',
                'message' => 'Absensi gagal dicatat'
            ]);
        }
        redirect('absensi/detail_absensi');
    }

public function export_pdf()
    {
        $this->load->library('pdf');
        $data = $this->detail_data_absen();
        $html_content = $this->load->view('absensi/print_pdf', $data, true);
        $filename = 'Absensi ' . $data['karyawan']->nama . ' - ' . bulan($data['bulan']) . ' ' . $data['tahun'] . '.pdf';

        $this->pdf->loadHtml($html_content);
        $this->pdf->render();
        $this->pdf->stream($filename, ['Attachment' => 1]);
      
        $this->load->model('Absensi_model');
		$result['absensi a'] = $this->Absensi_model->get_absen();
		$this->load->library('pdf');
		$this->pdf->setPaper('A4', 'potrait');
		$this->pdf->filename = "laporan-data-karyawan.pdf";
        $html_content = $this->load->view('absensi/print_pdf',  $result);
    }
    
    private function detail_data_absen()
    {
        $id_user = @$this->uri->segment(3) ? $this->uri->segment(3) : $this->session->id_user;
        $bulan = @$this->input->get('bulan') ? $this->input->get('bulan') : date('m');
        $tahun = @$this->input->get('tahun') ? $this->input->get('tahun') : date('Y');
        
        $data['karyawan'] = $this->karyawan->find($id_user);
        $data['absen'] = $this->absensi->get_absen($id_user, $bulan, $tahun);
        $data['jam_kerja'] = (array) $this->jam->get_all();
        $data['all_bulan'] = bulan();
        $data['bulan'] = $bulan;
        $data['tahun'] = $tahun;
        $data['hari'] = hari_bulan($bulan, $tahun);

        return $data;
    }
}


/* End of File: d:\Ampps\www\project\absen-pegawai\application\controllers\Absensi.php */