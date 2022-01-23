<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>Formulario</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

	<script type="text/javascript" language="javascript" src="js/ajax.js"></script>
	<link rel="stylesheet" href="css/layout.css" rel="stylesheet" type="text/css" />

</head>

<body class="ventanas">
	<blockquote>&nbsp;</blockquote>
	<form name="form1" method="post" action="add_registro.php">
		<h3 align="center">&nbsp;</h3>
		<h3 align="center">FORMULARIO DE CAMBIO DE SEDE DE EMPLEADOS</h3>


		<table width="418" border="opx" align="center">
			<tr>
				<td width="173"><label>Código Empleado </label></td>
				<td width="144"><input name="ced" type="number" required maxlength="20"></td>

			</tr>

			<tr>
				<td><label>Departamento </label></td>
				<td>
					<div>
						<?php

						//consumo de la api	

						$data = json_decode(file_get_contents('https://intcomex-test.apigee.net/v1/getplaces?locale=es&countryId=Co&apiKey=5012b669-f1eb-4eb4-bda8-d69d1ada3086&utcTimeStamp=2020-05-07T21:00:11.071Z&signature=b43f6d5eb1f9fa98388f2b69b01dabc1c6046e8f7a87e3ca99efe2d4dae04ba0'), true);
						//print_r ($data);
						$i = 0;


						?>


						<select name='departamento' id="" onChange="from(document.form1.departamento.value, 'midiv','zonas.php' )" required>
							<option value="">Seleccione</option>
							<?php while ($i < count($data)) { ?>
								<option value="<?php echo $data[$i]["Id"] ?> "><?php echo $data[$i]["Name"];
																				$i = $i + 1; ?></option>;
							<?php } ?>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td><label>Ciudad sede</label></td>
				<td>
					<div id="midiv">

					</div>
				</td>
			</tr>

			<tr>
				<td>Fecha de inicio</td>
				<td><input name="f_ini" type="date" required></td>
			</tr>
			<tr>
				<td><label>Fecha de finalización </label></td>
				<td><input name="f_fin" type="date"></td>
			</tr>

			<tr>
				<td colspan="2"><input name="registro" type="submit" value="Crear Registro"></td>

			</tr>
		</table>


		<p>&nbsp;</p>
	</form>


</body>



</html>