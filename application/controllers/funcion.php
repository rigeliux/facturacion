<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

use Moltin\Cart\Cart;
use Moltin\Cart\Storage\Session;
use Moltin\Cart\Identifier\Cookie;

class Funcion extends Public_Controller
{
	var $prods_query;

	public function __construct()
	{
		parent::__construct();
	}

	public function contacto()
	{
		$data = $this->input->post('contacto',true);
		$to = 'info@creatibooks.com';

		$asunto = 'Contacto desde Creatibooks.com';
		$headers  = 'MIME-Version: 1.0' . "\r\n";		
		$headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
		$headers .= 'From: '.$data['nombre'].' <'.$data['email'].'>' . "\r\nContent-type: text/html\r\n";
		
		$html = 'Nombre: <strong>'.$data['nombre'].'</strong><br />E-mail: '.$data['email'].'<br/>Tel: '.$data['tel'].'<br><strong>Mensaje: </strong>'.nl2br($data['mensaje']);
		
		if(@mail($to, $asunto, $html, $headers )){
			$json['error']='0';
			$json['header'] = 'Mensaje enviado';
			$json['msg']='<p>Muchas gracias por su preferencia, <strong>'.$data['nombre'].'</strong>.<br>En breve nos pondremos en contacto con usted.</p>';
		}else{
			$json['error']='1';
			$json['msg']='No se envio mensaje, intente nuevamente.';
		}
		
		echo json_encode($json);
	}

	public function pedido()
	{
		$this->load->model('pedidos/listado_model','pedidos_model');
		$this->pedidos_model->fields['crud']['pedido_carrito'] = base64_encode(serialize($this->cart->contents(true)));
		$this->pedidos_model->fields['crud']['pedido_total'] = $this->cart->total(false);
		
		$inserta = $this->pedidos_model->insertar();
		$msgs = $this->pedidos_model->messages($inserta);

		if(!$inserta || $inserta['error']){
			$json['error'] ='1';
			$json['msg'] = $msgs[insertar][error];
			$json['header'] = 'Error al insertar';
		} else {
			$this->cart->destroy();
			$json['error'] = '0';
			$json['header'] = $msgs[insertar][exito];
			$json['msg'] = '<div class="function_result">Muchas gracias por su preferencia, en breve le llegará un correo electrónico con el contenido de su pedido y las instrucciones para pagar.<br>¡Gracias!</div>';
			$json['result'] = 'location.reload();';
			//$json['extra'] = $inserta[0];
		}

		echo json_encode($json);
	}
}