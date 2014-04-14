<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends Public_Controller {

	public function __construct() {
		parent::__construct();
	}
	
	public function index()
	{
		$this->load->model('images_model');
		$this->load->model('productos/web_listado_model', NULL, TRUE);

		$this->constantData['titulo'] = 'Bienvenidos';
		$dataTag['tags'] = $this->web_listado_model->getRelacionados();
		$this->constantData['tagOrTitle'] = $this->viewWeb('comunes/tag',$dataTag,TRUE);
		
		//$data['destacados'] = $this->_listDestacados();
		
		$args_model = array(
				'tipo_id'=>'2'
			);
		$this->images_model->initialize($args_model);
		$data[images] = $this->images_model->getDatosByRel(0);
		$this->viewWeb('comunes/top',$this->constantData);
		$this->viewWeb('home',$data);
		$this->viewWeb('comunes/bottom');
	}

	public function ayuda()
	{
		$this->constantData['titulo'] = 'Ayuda';
		$this->constantData['tagOrTitle'] = '<h4 class="c-azul pa-l-2x">Preguntas frecuentes</h4>';
		$this->constantData['padre']= 'a';
		
		//$data['destacados'] = $this->_listDestacados();
		$this->viewWeb('comunes/top',$this->constantData);
		$this->viewWeb('ayuda');
		$this->viewWeb('comunes/bottom');
	}

	public function aviso()
	{
		$this->constantData['titulo'] = 'Aviso de privacidad';
		$this->constantData['tagOrTitle'] = '<h4 class="c-azul pa-l-2x">Aviso de privacidad</h4>';
		$this->constantData['padre']= 'a';
		
		//$data['destacados'] = $this->_listDestacados();
		$this->viewWeb('comunes/top',$this->constantData);
		$this->viewWeb('aviso');
		$this->viewWeb('comunes/bottom');
	}

	public function pedidos()
	{
		$this->load->model('pedidos/listado_model','pedidos');
		$this->constantData['titulo'] = 'Orden de Pedido';
		$this->constantData['padre']= 'a';
		$this->constantData['pedido']= $this->pedidos->datosInfo(1);
		
		//$data['destacados'] = $this->_listDestacados();
		$this->viewWeb('pedido',$this->constantData);
	}	
}

/* End of file home.php */
/* Location: ./application/controllers/home.php */