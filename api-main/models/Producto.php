<?php

class Product {

    private $conn;
    
    public $id;
    public $nombre;
    public $descripcion;
    public $precio;
    public $stock;
    public $categoria;
    
    public function __construct($db) {
        $this->conn = $db;
    }

    // Obtener todos los productos
    public function fetchAll() {
        $stmt = $this->conn->prepare('SELECT * FROM productos');
        $stmt->execute();
        return $stmt;
    }

    // Obtener un solo producto por ID
    public function fetchOne() {
        $stmt = $this->conn->prepare('SELECT * FROM productos WHERE id = ?');
        $stmt->bindParam(1, $this->id);
        $stmt->execute();

        if($stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            $this->id = $row['id'];
            $this->nombre = $row['nombre'];
            $this->descripcion = $row['descripcion'];
            $this->precio = $row['precio'];
            $this->stock = $row['stock'];
            $this->categoria = $row['categoria'];

            return TRUE;
        }
        
        return FALSE;
    }

    // Crear un nuevo producto
    public function postData() {
        $stmt = $this->conn->prepare('INSERT INTO productos SET nombre = :nombre, descripcion = :descripcion, precio = :precio, stock = :stock, categoria = :categoria');

        $stmt->bindParam(':nombre', $this->nombre);
        $stmt->bindParam(':descripcion', $this->descripcion);
        $stmt->bindParam(':precio', $this->precio);
        $stmt->bindParam(':stock', $this->stock);
        $stmt->bindParam(':categoria', $this->categoria);

        if($stmt->execute()) {
            return TRUE;
        }

        return FALSE;
    }

    // Actualizar un producto existente
    public function putData() {
        $stmt = $this->conn->prepare('UPDATE productos SET nombre = :nombre, descripcion = :descripcion, precio = :precio, stock = :stock, categoria = :categoria WHERE id = :id');

        $stmt->bindParam(':nombre', $this->nombre);
        $stmt->bindParam(':descripcion', $this->descripcion);
        $stmt->bindParam(':precio', $this->precio);
        $stmt->bindParam(':stock', $this->stock);
        $stmt->bindParam(':categoria', $this->categoria);
        $stmt->bindParam(':id', $this->id);

        if($stmt->execute()) {
            return TRUE;
        }

        return FALSE;
    }

    // Eliminar un producto por ID
    public function delete() {
        $stmt = $this->conn->prepare('DELETE FROM productos WHERE id = :id');
        $stmt->bindParam(':id', $this->id);

        if($stmt->execute()) {
            return TRUE;
        }

        return FALSE;
    }
}

