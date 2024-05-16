<?php
// Configurar encabezados HTTP para permitir CORS y definir el tipo de contenido
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

// Incluir archivos necesarios para la conexión a la base de datos y el modelo de producto
include_once '../config/Database.php';
include_once '../models/Product.php';

// Verificar que el método de solicitud sea GET
if ($_SERVER['REQUEST_METHOD'] === 'GET') {

    // Crear instancia de la base de datos y conectar
    $database = new Database();
    $db = $database->connect();

    // Crear instancia del producto
    $product = new Product($db);

    // Obtener datos del cuerpo de la solicitud
    $data = json_decode(file_get_contents("php://input"));

    // Verificar que se haya proporcionado un ID de producto
    if (isset($data->id)) {
        $product->id = $data->id;

        // Intentar obtener el producto
        if ($product->fetchOne()) {
            // Crear un arreglo con los datos del producto
            $product_arr = array(
                'id' => $product->id,
                'nombre' => $product->nombre,
                'descripcion' => $product->descripcion,
                'precio' => $product->precio,
                'stock' => $product->stock,
                'categoria' => $product->categoria
            );

            // Devolver los datos del producto en formato JSON
            echo json_encode($product_arr);
        } else {
            // Si no se encontró el producto, devolver un mensaje de error
            echo json_encode(array('message' => 'Producto no encontrado'));
        }
    } else {
        // Si no se proporcionó un ID de producto, devolver un mensaje de error
        echo json_encode(array('message' => 'Error: Falta el ID del producto'));
    }
} else {
    // Si el método de solicitud no es GET, devolver un mensaje de error
    echo json_encode(array('message' => 'Error: Método incorrecto'));
}
