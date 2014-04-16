<?php
/* Ruta del servicio de integracion*/
$ws = "http://74.81.83.152/ServicioIntegracionPruebas/Timbrado.asmx?wsdl";
$response = '';
/* Ruta del comprobante a timbrar*/
$rutaArchivo = 'C:\comprobanteSinTimbrar.xml';
/* El servicio recibe el comprobante (xml) codificado en Base64, el rfc del emisor deberá ser 'AAA010101AAA' para efecto de pruebas*/ 
$base64Comprobante = file_get_contents($rutaArchivo);
$base64Comprobante = base64_encode($base64Comprobante);
try
{
$params = array();
/*Nombre del usuario integrador asignado, para efecto de pruebas utilizaremos 'mvpNUXmQfK8='*/
$params['usuarioIntegrador'] = 'mvpNUXmQfK8=';
/* Comprobante en base 64*/
$params['xmlComprobanteBase64'] = $base64Comprobante;
/*Id del comprobante, deberá ser un identificador único, para efecto del ejemplo se utilizará un numero aleatorio*/
$params['idComprobante'] = rand(5, 999999);
$client = new SoapClient($ws,$params);
$response = $client->__soapCall('TimbraCFDI', array('parameters' => $params));
}
catch (SoapFault $fault)
{
echo "SOAPFault: ".$fault->faultcode."-".$fault->faultstring."\n";
}
/*Obtenemos resultado del response*/
$tipoExcepcion = $response->TimbraCFDIResult->anyType[0];
$numeroExcepcion = $response->TimbraCFDIResult->anyType[1];
$descripcionResultado = $response->TimbraCFDIResult->anyType[2];
$xmlTimbrado = $response->TimbraCFDIResult->anyType[3];
$codigoQr = $response->TimbraCFDIResult->anyType[4];
$cadenaOriginal = $response->TimbraCFDIResult->anyType[5];

if($xmlTimbrado != '')
{
/*El comprobante fue timbrado correctamente*/

/*Guardamos comprobante timbrado*/
file_put_contents('C:\Users\Andres\Desktop\comprobanteTimbrado.xml', $xmlTimbrado);

/*Guardamos codigo qr*/
file_put_contents('C:\Users\Andres\Desktop\codigoQr.jpg', $codigoQr);

/*Guardamos cadena original del complemento de certificacion del SAT*/
file_put_contents('C:\Users\Andres\Desktop\cadenaOriginal.txt', $cadenaOriginal);

print_r("Timbrado exitoso");

}
else
{
print_r($descripcionResultado);
}
?>