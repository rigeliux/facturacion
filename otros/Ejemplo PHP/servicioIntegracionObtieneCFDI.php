<?php
/* Ruta del servicio de integracion*/
$ws = "http://74.81.83.152/ServicioIntegracionPruebas/Timbrado.asmx?wsdl";
$response = '';
/* El servicio para obtener un cfdi previamente timbrado recibe 3 parámetros*/

/*Usuario Integrador*/
$usuarioIntegrador = 'mvpNUXmQfK8=';

/*Rfc del Emisor que emitió el comprobante*/
$rfcEmisor = 'AAA010101AAA';

/*Folio fiscal(UUID) del comprobante a obtener, deberá ser uno válido de los que hayamos timbrado previamente en pruebas*/
$folioUUID = '2961B686-65A1-4A0D-8C76-76D95B6558DF';

try
{
$params = array();
/*Nombre del usuario integrador asignado, para efecto de pruebas utilizaremos 'mvpNUXmQfK8='*/
$params['usuarioIntegrador'] = $usuarioIntegrador;
/* Rfc emisor que emitió el comprobante*/
$params['rfcEmisor'] = $rfcEmisor;
/*Folio fiscal del comprobante a obtener*/
$params['folioUUID'] = $folioUUID;

$client = new SoapClient($ws,$params);
$response = $client->__soapCall('ObtieneCFDI', array('parameters' => $params));
}
catch (SoapFault $fault)
{
echo "SOAPFault: ".$fault->faultcode."-".$fault->faultstring."\n";
}
/*Obtenemos resultado del response*/
$tipoExcepcion = $response->ObtieneCFDIResult->anyType[0];
$numeroExcepcion = $response->ObtieneCFDIResult->anyType[1];
$descripcionResultado = $response->ObtieneCFDIResult->anyType[2];
$xmlTimbrado = $response->ObtieneCFDIResult->anyType[3];
$codigoQr = $response->ObtieneCFDIResult->anyType[4];
$cadenaOriginal = $response->ObtieneCFDIResult->anyType[5];

if($numeroExcepcion == "0")
{
/*El comprobante fue consultado exitosamente*/

/*Guardamos comprobante timbrado*/
file_put_contents('C:\Users\Andres\Desktop\comprobanteConsultado.xml', $xmlTimbrado);

print_r("El comprobante fue consultado correctamente");

}
else
{
print_r($descripcionResultado);
}
?>