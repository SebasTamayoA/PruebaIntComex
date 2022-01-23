<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Lista empleados</title>

	<link rel="stylesheet" type="text/css" href="tablasjquery/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="tablasjquery/dataTables.tableTools.css">
	<link rel="stylesheet" href="css/layout.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript" src="js/js/jquery.js"></script>
	<script type="text/javascript" language="javascript" src="js/js/jquery.dataTables.js"></script>
	<script type="text/javascript" language="javascript" src="js/js/dataTables.tableTools.js"></script>
	<script type="text/javascript" language="javascript">
		$(document).ready(function() {
			$('#contenido').dataTable({
				"scrollY": 200,
				"paging": false,
				"scrollX": true
			});
			var table = $('#contenido').DataTable();
			$('#contenido tbody').on('click', 'tr', function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});
			$('#button').click(function() {
				table.row('.selected').remove().draw(false);
			});
		});
	</script>

</head>

<body class="ventanas">


	<table width="100%">

		<tr>
			<td>
				<h3 align="center">LISTA DE EMPLEADOS</h3>
				<p>&nbsp;</p>

				<table width="100%" id="contenido" class="hover">
					<thead>
						<tr class="fuente_blanca" bgcolor="#900">
							<th width="9%" align="center" bgcolor="#FFFF66" scope="col">Codigo</th>
							<th width="15%" align="center" bgcolor="#FFFF66" scope="col">Nombre</th>
							<th width="11%" align="center" bgcolor="#FFFF66" scope="col">Sede</th>
							<th width="17%" align="center" bgcolor="#FFFF66" scope="col">Inicio</th>
							<th width="7%" align="center" bgcolor="#FFFF66" scope="col">Fin</th>
						</tr>
					</thead>
					<tbody>
						<?php

						$inc = include("con_db.php");

						if ($inc) {

							$sql = "select * from employees e inner join camp_emp c on e.emp_no=c.emp_no ";

							$res = mysqli_query($link, $sql);

							while ($fila = mysqli_fetch_array($res)) {

								$codigo = $fila['emp_no'];
								$nombre = $fila['first_name'];
								$apellido = $fila['last_name'];
								$nacimiento = $fila['birth_date'];
								$genero = $fila['gender'];
								$sede = $fila['cod_campus'];
								$inicio = $fila['from_date'];
								$fin = $fila['to_date'];

								echo '<tr >
					<td>' . $codigo . '</td>
					<td>' . $nombre . ' ' . $apellido . '</td>
					<td>' . $sede . '</td>
					<td>' . $inicio . '</td>
					<td>' . $fin . '</td>
					</tr> ';
							}
						}
						?>
					</tbody>

				</table>
			</td>
		</tr>
		<th align="center"><a href="javascript:history.back(-1);" title="Ir la página anterior">Volver</a></th>
	</table>
</body>

</html>