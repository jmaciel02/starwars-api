<?php

declare(strict_types=1);

// Habilitar exibição de erros para debug
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

// Definir constantes
define('BASE_PATH', dirname(__DIR__));

// Registrar autoloader
spl_autoload_register(function ($class) {
    // Converter namespace para caminho de arquivo
    $file = BASE_PATH . '/' . str_replace('\\', '/', $class) . '.php';
    
    if (file_exists($file)) {
        require $file;
        return true;
    }
    
    // Log para debug
    error_log("Classe não encontrada: {$class} (Arquivo: {$file})");
    return false;
});

// Verificar requisitos básicos
if (!extension_loaded('pdo_mysql')) {
    die('A extensão PDO MySQL é necessária');
}

if (!is_writable(BASE_PATH . '/logs')) {
    die('O diretório de logs precisa ter permissão de escrita');
}

// Carregar rotas
require BASE_PATH . '/routes/web.php'; 
