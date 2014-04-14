<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

use Moltin\Cart\Cart;
use Moltin\Cart\Storage\Session;
use Moltin\Cart\Identifier\Cookie;

class Pedido extends Public_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('pedidos/listado_model','pedidos_model');
		$this->pedidos_model->fields['crud']['pedido_carrito'] = base64_encode(serialize($this->cart->contents(true)));
		$this->pedidos_model->fields['crud']['pedido_total'] = $this->cart->total(false);
	}

	public function index()
	{
		$inserta = $this->pedidos_model->insertar();
		$msgs = $this->pedidos_model->messages($inserta);

		if(!$inserta || $inserta['error']){
			$json['error'] = 1;
			$json['msg'] = $msgs[insertar][error];
			$json['titulo'] = 'Error al insertar';
			$json['desc'] = $msgs[insertar][error];
		} else {
			$json['error'] = 0;
			$json['msg'] = ucfirst($seccion).' registrado con exito';
			$json['desc'] = '<div class="function_result">'.$msgs[insertar][exito].'</div>';
			//$json['extra'] = $inserta[0];
		}

		echo '<pre>'.print_r($json,true).'</pre>';
	}



}