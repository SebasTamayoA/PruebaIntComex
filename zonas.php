<?php

//recibo por  get el valor  del departamento
$depto = $_GET['id'];

//consumo de la api
$data = json_decode(file_get_contents('https://intcomex-test.apigee.net/v1/getplaces?locale=es&countryId=CO&parentId=' . $depto . '&apiKey=63849496-b505-485f-abb5-5c4b15a9a0d4&utcTimeStamp=2019-09-03T14:23:33.476Z&signature=3d8b4a7f494930dec2415baf5af9ddce8b0701b65c68323c228b288a56f66671'), true);
//print_r ($data);
$i = 0;

?>

<select name="zonas" id="" required="required">
	<option value="">Seleccione</option>
	<?php while ($i < count($data)) {

	?>
		<option value=" <?php echo $data[$i]["Id"] ?>"><?php echo utf8_encode($data[$i]["Name"]);
														$i = $i + 1; ?></option>
	<?php } ?>
</select>