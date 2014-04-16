<?php
/* Ruta del servicio de integracion*/
$ws = "http://74.81.83.152/ServicioIntegracionPruebas/Timbrado.asmx?wsdl";
$response = '';
/* El servicio para registrar un emisor recibe 5 parámetros*/

/*Usuario Integrador*/
$usuarioIntegrador = 'mvpNUXmQfK8=';

/*Rfc Emisor a registrar*/
$rfcEmisor = 'AAA010101AAA';

/*Archivo .cer base64*/
$rutaCer = 'C:\aaa010101aaa__csd_01.cer';
$base64Cer = file_get_contents($rutaCer);
$base64Cer = base64_encode($base64Cer);

/*Archivo .key base64*/
$rutaKey = 'C:\aaa010101aaa__csd_01.key';
$base64Key = file_get_contents($rutaKey);
$base64Key = base64_encode($base64Key);

/*Contraseña del sello*/
$contrasena = '12345678a';

try
{
$params = array();
/*Nombre del usuario integrador asignado, para efecto de pruebas utilizaremos 'mvpNUXmQfK8='*/
$params['usuarioIntegrador'] = $usuarioIntegrador;
/* Rfc emisor a registrar 64*/
$params['rfcEmisor'] = $rfcEmisor;
/*Archivo .cer en base 64, sello digital del emisor*/
$params['base64Cer'] = $base64Cer;
/*Archivo .key en base 64, sello digital del emisor*/
$params['base64Key'] = $base64Key;
/*Contraseña, sello digital del emisor*/
$params['contrasena'] = $contrasena;
$client = new SoapClient($ws,$params);
$response = $client->__soapCall('RegistraEmisor', array('parameters' => $params));
}
catch (SoapFault $fault)
{
echo "SOAPFault: ".$fault->faultcode."-".$fault->faultstring."\n";
}
/*Obtenemos resultado del response*/
$tipoExcepcion = $response->RegistraEmisorResult->anyType[0];
$numeroExcepcion = $response->RegistraEmisorResult->anyType[1];
$descripcionResultado = $response->RegistraEmisorResult->anyType[2];
$xmlTimbrado = $response->RegistraEmisorResult->anyType[3];
$codigoQr = $response->RegistraEmisorResult->anyType[4];
$cadenaOriginal = $response->RegistraEmisorResult->anyType[5];

if($numeroExcepcion == "0")
{
/*El emisor fue registrado correctamente*/

print_r("El emisor fue registrado correctamente");

}
else
{
print_r($descripcionResultado);
}
?>