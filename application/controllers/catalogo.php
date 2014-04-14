<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Catalogo extends Public_Controller {
	var $prods_query;

	public function __construct() {
		parent::__construct();
		$this->load->model('productos/web_listado_model', NULL, TRUE);
		
	}
	
	public function index($page=NULL)
	{
		$this->constantData['baseSlug'] = 'catalogo';
		$this->load->library('paginatron');

		$this->constantData['paginacion'] = $this->_listado($page);
		
		$this->session->set_flashdata('page', $this->paginatron->config['cur_page']);
		$this->session->set_flashdata('getvars', $this->paginatron->config['getvars']);
		$this->session->set_flashdata('coming', $this->constantData['baseSlug']);
	
		$this->constantData['titulo'] = 'Catalogo de Productos';
		$dataTag['tags'] = $this->web_listado_model->getRelacionados();
		$this->constantData['tagOrTitle'] = $this->viewWeb('comunes/tag',$dataTag,TRUE);
		
		//$data['destacados'] = $this->_listDestacados();
		$this->viewWeb('comunes/top',$this->constantData);
		$this->viewWeb('catalogo',$this->constantData);
		$this->viewWeb('comunes/bottom');
	}
	
	public function producto($item=null)
	{
		if($item==null){
			redirect('catalogo');
		}

		$this->load->model('images_model');
		$this->images_model->initialize( array('tipo_id'=>'1') );

		$data = $this->web_listado_model->getProducto($item);
		$data['images'] = $this->images_model->getDatosByRel( getId($item) );

		$this->constantData['item'] = $data;
		$this->constantData['titulo'] = $data['producto_nombre'];
		$dataTag['tags'] = $this->web_listado_model->getRelacionados();
		$this->constantData['tagOrTitle'] = $this->viewWeb('comunes/tag',$dataTag,TRUE);

		$this->constantData['volver_href'] = getHref('catalogo');
		
		$this->viewWeb('comunes/top',$this->constantData);
		$this->viewWeb('producto',$this->constantData);
		$this->viewWeb('comunes/bottom');
	}

	public function buscar($string,$page=NULL){
		if( !isset($string) || $string==''){
			$post = $this->input->post('search',TRUE);
			$redirect='catalogo/';
			if($post!=''){
				$redirect='buscar/'.$post;
			}
			redirect($redirect);
		}

		$this->constantData['baseSlug'] = 'buscar/'.$string;
		$this->load->library('paginatron');

		$string = urldecode($string);
		$this->constantData['query_string'] = $string;
		$this->constantData['paginacion'] = $this->_listado($page,$string);
		
		$this->session->set_flashdata('page', $this->paginatron->config['cur_page']);
		$this->session->set_flashdata('getvars', $this->paginatron->config['getvars']);
		$this->session->set_flashdata('coming', $this->constantData['baseSlug']);
	
		$this->constantData['titulo'] = 'Resultados de la busqueda: '.$string;
		$dataTag['tags'] = $this->web_listado_model->getRelacionados();
		$this->constantData['tagOrTitle'] = $this->viewWeb('comunes/tag',$dataTag,TRUE);
		
		$this->viewWeb('comunes/top',$this->constantData);
		$this->viewWeb('catalogo',$this->constantData);
		$this->viewWeb('comunes/bottom');
	}

	public function etiqueta($string,$page=NULL)
	{
		if( !isset($string) || $string==''){
			$redirect='catalogo/';
			redirect($redirect);
		}

		$this->constantData['baseSlug'] = 'etiqueta/'.$string;
		$this->load->library('paginatron');

		$this->constantData['paginacion'] = $this->_listadoTags($page,$string);
		
		$this->session->set_flashdata('page', $this->paginatron->config['cur_page']);
		$this->session->set_flashdata('getvars', $this->paginatron->config['getvars']);
		$this->session->set_flashdata('coming', $this->constantData['baseSlug']);
	
		$this->constantData['titulo'] = 'Resultados de Etiqueta: '.$this->constantData['paginacion']['etiqueta']['categoria_nombre'];
		$dataTag['tags'] = $this->web_listado_model->getRelacionados();
		$this->constantData['tagOrTitle'] = $this->viewWeb('comunes/tag',$dataTag,TRUE);
		
		$this->viewWeb('comunes/top',$this->constantData);
		$this->viewWeb('catalogo',$this->constantData);
		$this->viewWeb('comunes/bottom');
	}

	function _listado($page=NULL,$string=NULL){
		
		$cur_page = ($page!=NULL ? $page:'1');
		$per_page = 9;
		
		$this->prods_query = $this->web_listado_model->getProductos($cur_page,$per_page,$string);
		$total_Rows = $this->web_listado_model->getTotalRows();
		
		$params['cur_page']	= $cur_page;
		$params['per_page']	= $per_page;
		$params['total']	= $total_Rows;
		//$params['baseSlug']	= site_url($this->constantData['baseSlug']);
		
		$this->paginatron->init($params);

		$data['productos_listado']=$this->_listProductos();
		$data['productos_paginacion']=$this->paginatron->pagi['nav'];

		return $data;
	}

	function _listadoTags($page=NULL,$string)
	{
		$cur_page = ($page!=NULL ? $page:'1');
		$per_page = 9;
		
		$this->prods_query = $this->web_listado_model->getProductosTags($cur_page,$per_page,$string);
		$total_Rows = $this->web_listado_model->getTotalRows();
		
		$params['cur_page']	= $cur_page;
		$params['per_page']	= $per_page;
		$params['total']	= $total_Rows;
		$params['baseSlug']	= site_url($this->constantData['baseSlug']);
		
		$this->paginatron->init($params);

		$data['productos_listado']=$this->_listProductos();
		$data['productos_paginacion']=$this->paginatron->pagi['nav'];
		$data['etiqueta']=$this->prods_query->row_array();

		return $data;
	}
	
	function _listProductos(){
		$query = $this->prods_query;
		$html = '';
		if($query->num_rows() > 0){
			$a=0;
			foreach($query->result_array() as $row){
				$row['producto_detalles'] = explode('<br />',nl2br($row['producto_detalles']));
				$row['cleanNombre'] = stripHtmlTags($row['producto_nombre']);
				$row['enlace']=getSlug($row['cleanNombre']).'-'.ltrim($row['producto_id'],'0');
				$row['imagen']=$this->web_listado_model->getImagenProducto($row['producto_id']);
				$row['a']=$a;

				$html.=$this->viewWeb('producto_listado',$row,true);

				$a++;
				
			}
			
		} else {
			$html = '<li class="span4 pa-b">
						<div class="producto">
							<div class="producto-info">
								<div class="producto-titulo">
									<h4 class="semi-ital c-azul">No se encontró ningún resultado con las opciones seleccionadas.</h4>
								</div>
							</div>
						</div>
					</li>';
		}
		return $html;
	}
	
}

/* End of file catalogo.php */
/* Location: ./application/controllers/catalogo.php */