<?php
    // Habilitar la visualización de errores
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    // Permitir CORS y establecer el tipo de contenido
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: DELETE');
    header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');

    // Incluir archivos de configuración de la base de datos y modelo de producto
    include_once '../config/Database.php';
    include_once '../models/Producto.php';

    // Verificar si el método de la solicitud es DELETE
    if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {

        // Instanciar la base de datos y el objeto producto
        $database = new Database();
        $db = $database->connect();

        // Instanciar el objeto producto
        $product = new Product($db);

        // Obtener los datos enviados en la solicitud
        $data = json_decode(file_get_contents("php://input"));

        // Establecer el ID del producto a eliminar
        $product->id = isset($data->id) ? $data->id : NULL;

        // Verificar si el ID está definido
        if (!is_null($product->id)) {
            // Intentar eliminar el producto
            if ($product->delete()) {
                echo json_encode(array('message' => 'Producto eliminado'));
            } else {
                echo json_encode(array('message' => 'Producto no eliminado, intente de nuevo!'));
            }
        } else {
            echo json_encode(array('message' => 'Error: Falta el ID del producto!'));
        }
    } else {
        echo json_encode(array('message' => 'Error: Método incorrecto!'));
    }

