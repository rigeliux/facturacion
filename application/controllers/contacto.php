<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Contacto extends Public_Controller {

	public function __construct() {
		parent::__construct();
	}
	
	public function index()
	{
		//$this->load->model('productos/web_listado_model', NULL, TRUE);
		$this->constantData['titulo'] = 'Contacto';
		$this->constantData['tagOrTitle'] = '<h4 class="c-azul pa-l-2x">Revisa que tus datos sean correctos</h4>';
		
		//$data['destacados'] = $this->_listDestacados();
		$this->viewWeb('comunes/top',$this->constantData);
		$this->viewWeb('contacto');
		$this->viewWeb('comunes/bottom');
	}
	
	
}

/* End of file contacto.php */
/* Location: ./application/controllers/contacto.php */