<?php
/* Ruta del servicio de integracion*/
$ws = "http://74.81.83.152/ServicioIntegracionPruebas/Timbrado.asmx?wsdl";
$response = '';
/* El servicio para cancelar un cfdi recibe 3 parámetros*/

/*Usuario Integrador*/
$usuarioIntegrador = 'mvpNUXmQfK8=';

/*Rfc del Emisor que emitió el comprobante*/
$rfcEmisor = 'AAA010101AAA';

/*Folio fiscal(UUID) del comprobante a cancelar, deberá ser uno válido de los que hayamos timbrado previamente en pruebas*/
$folioUUID = '2961B686-65A1-4A0D-8C76-76D95B6558DF';

try
{
$params = array();
/*Nombre del usuario integrador asignado, para efecto de pruebas utilizaremos 'mvpNUXmQfK8='*/
$params['usuarioIntegrador'] = $usuarioIntegrador;
/* Rfc emisor que emitió el comprobante*/
$params['rfcEmisor'] = $rfcEmisor;
/*Folio fiscal del comprobante a cancelar*/
$params['folioUUID'] = $folioUUID;

$client = new SoapClient($ws,$params);
$response = $client->__soapCall('CancelaCFDI', array('parameters' => $params));
}
catch (SoapFault $fault)
{
echo "SOAPFault: ".$fault->faultcode."-".$fault->faultstring."\n";
}
/*Obtenemos resultado del response*/
$tipoExcepcion = $response->CancelaCFDIResult->anyType[0];
$numeroExcepcion = $response->CancelaCFDIResult->anyType[1];
$descripcionResultado = $response->CancelaCFDIResult->anyType[2];
$xmlTimbrado = $response->CancelaCFDIResult->anyType[3];
$codigoQr = $response->CancelaCFDIResult->anyType[4];
$cadenaOriginal = $response->CancelaCFDIResult->anyType[5];

if($numeroExcepcion == "0")
{
/*El comprobante fue cancelado exitosamente*/

print_r("El comprobante fue cancelado correctamente");

}
else
{
print_r($descripcionResultado);
}
?>