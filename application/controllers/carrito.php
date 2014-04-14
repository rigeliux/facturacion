<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

use Moltin\Cart\Cart;
use Moltin\Cart\Storage\Session;
use Moltin\Cart\Identifier\Cookie;

class Carrito extends Public_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('productos/web_listado_model', NULL, TRUE);
	}
	
	public function index()
	{
		$this->constantData['titulo'] = 'Carrito';
		$this->constantData['tagOrTitle'] = '<h4 class="c-azul pa-l-2x">Recuerda revisar tu pedido antes de solicitarlo.</h4>';
		
		//$data['destacados'] = $this->_listDestacados();
		$this->constantData['items'] = $this->cart->contents(true);
		$this->constantData['total'] = $this->cart->total(false);
		$this->viewWeb('comunes/top',$this->constantData);
		$this->viewWeb('carrito',$this->constantData);
		$this->viewWeb('comunes/bottom');
	}
	
	public function agregar()
	{
		$input = $this->input->post('item',true);
		
		//$input['id']=4;
		if ($input!==false) {
			$item = $this->web_listado_model->getProducto($input['id']);
			$this->cart->insert(array(
			    'id'       => $item['producto_clave'],
			    'name'     => $item['producto_nombre'],
			    'price'    => $item['producto_precio'],
			    'quantity' => 1
			));

			$json['error']='0';
			$json['data']['item']['nombre']=$item['producto_nombre'];
			$json['data']['total_items']=$this->cart->totalItems();
			$json['data']['total']= number_format($this->cart->total(false),2);

			echo json_encode($json);
		} else {
			redirect('/');
		}
		
	}

	public function editar()
	{
		/*
		Esto SI FUNCIONA!!!, REVISAR MAS ADELANTE
		$item_id = $this->cart->find('foo2')->__get('identifier');
		$new = array(
				'name'=>'Este es foobar2'
			);
		$this->cart->update($item_id,$new);
		*/
		$input = $this->input->post('item',true);
		if ($input!==false) {
			foreach ($input as $key => $item) {
				$new_info = array(
					'quantity'=>$item['qty']
				);
				$this->cart->update($key,$new_info);
			}

			$json['error']='0';
			$json['data']['total_items']=$this->cart->totalItems();
			$json['data']['total']= number_format($this->cart->total(false),2);

			//echo json_encode($json);
			redirect('carrito');
		} else {
			redirect('carrito');
		}
	}

	public function eliminar($id)
	{
			$this->cart->remove($id);
			$json['error']='0';
			$json['data']['total_items']=$this->cart->totalItems();
			$json['data']['total']=$this->cart->total(false);

			//echo json_encode($json);
			redirect('carrito');
	}

	public function limpiar()
	{
		$this->cart->destroy();
		redirect('carrito');
	}
	
}

/* End of file carrito.php */
/* Location: ./application/controllers/carrito.php */