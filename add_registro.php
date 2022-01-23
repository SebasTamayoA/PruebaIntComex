<?php


//recojo variables que llegan por post

$fech_ini = $_POST['f_ini'];
$codigo = $_POST['ced'];
$fech_fin = $_POST['f_fin'];
$municipio_sede = $_POST['zonas'];

//incluyo conexión a la base de datos

$inc = include("con_db.php");

if ($inc) {

	//validacion de existencia de usuario y sede 	  
	//validar el usuario  

	$contador = 0;
	$conta_emple = 0;

	if ($codigo != ""  && $fech_ini != "" && $fech_fin != "" && $municipio_sede != "") {

		//validar usuario creado 
		$existe_usuario = "SELECT * FROM employees WHERE emp_no=" . $codigo;
		$resul = mysqli_query($link, $existe_usuario);

		while ($fila = mysqli_fetch_array($resul)) {
			$conta_emple++;
		}

		//existencia de sede y usuario  creado
		$sql = "SELECT * FROM camp_emp WHERE emp_no=" . $codigo . "   and cod_campus =" . $municipio_sede;
		$res = mysqli_query($link, $sql);


		while ($fila = mysqli_fetch_array($res)) {
			$contador++;
			//echo $fila['first_name'];
		}


		// existe el registro, entonces actualizamos datos 

		if ($conta_emple > 0) {
			if ($contador > 0) {
				$sql1 = "UPDATE  camp_emp SET from_date='" . $fech_ini . "',to_date='" . $fech_fin . "'  WHERE emp_no=" . $codigo . "   and cod_campus =" . $municipio_sede;
				$res = mysqli_query($link, $sql1);
				echo '<script language="javascript">alert("Se actualiza el registro existente");</script>';
				echo '<script language="javascript">window.location="listado_empleado_sedes.php"</script>';
			} else {
				$sql2 = "INSERT INTO  camp_emp( from_date, to_date, emp_no ,cod_campus ) VALUES ('" . $fech_ini . "' ,'" . $fech_fin . "'," . $codigo . "," . $municipio_sede . ")";
				$res = mysqli_query($link, $sql2);
				echo '<script language="javascript">alert(" el registro fue creado");</script>';
				echo '<script language="javascript">window.location="listado_empleado_sedes.php"</script>';
			}
		} else {
			echo '<script language="javascript">alert(" el registro no existe en la tabla empleados");</script>';
			echo '<script language="javascript">window.location="Formulario.php"</script>';
		}
	}
}
