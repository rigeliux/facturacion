		<div class="navi">
			<ul class='main-nav'>
				<li class="<?=$padre=='home' ? 'active':''?>">
					<a href="admin/" class='light'>
						<div class="ico"><i class="fa fa-home icon-white"></i></div>
						Inicio
					</a>
				</li>
				
				<li class="<?=$padre=='catalogos' ? 'active open':''?>">
					<a href="#" class='light toggle-collapsed'>
						<div class="ico"><i class="fa fa-th-list icon-white"></i></div>
						Catalogos
						<span class="icono menu subnav subnav-down"></span>
					</a>
					<ul class='collapsed-nav <?=($padre=='catalogos' ? 'open':'closed')?>'>
						<li class="<?=(($padre=='catalogos' && $hijo=='productos' && $clase=='listado') ? 'active':'')?>"><a href="admin/productos/">Listado</a></li>
                        <li class="<?=(($padre=='catalogos' && $hijo=='clientes' && $clase=='listado') ? 'active':'')?>"><a href="admin/clientes/">Categorias</a></li>
					</ul>
				</li>

				<li class="<?=$padre=='catalogos' ? 'active':''?>">
					<a href="admin/pedidos/listado" class='light'>
						<div class="ico"><i class="fa fa-credit-card icon-white"></i></div>
						Facturas
					</a>
				</li>

				<li class="<?=$padre=='Clientes' || $hijo=='listado' ? 'active':''?>">
					<a href="admin/productos/listado" class='light'>
						<div class="ico"><i class="fa fa-home icon-white"></i></div>
						Inicio
					</a>
				</li>
                
				
                <li class="<?=$padre=='pedidos' ? 'active':''?>">
					<a href="admin/pedidos/listado" class='light'>
						<div class="ico"><i class="fa fa-credit-card icon-white"></i></div>
						Pedidos
					</a>
				</li>
				<li class="<?=$padre=='usuarios' ? 'active':''?>">
					<a href="#" class='light toggle-collapsed'>
						<div class="ico"><i class="fa fa-user icon-white"></i></div>
						Usuarios
						<span class="icono menu subnav subnav-down"></span>
					</a>
					<ul class='collapsed-nav <?=($padre=='usuarios' ? 'open':'closed')?>'>
						<li class="<?=(($padre=='usuarios' && $hijo=='listado') ? 'active':'')?>"><a href="admin/usuarios/listado">Listado</a></li>
					</ul>
				</li>
			</ul>
		</div>