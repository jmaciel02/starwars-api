<?php

declare(strict_types=1);

namespace App\Helpers;

use RuntimeException;

class Router
{
    private array $routes = [];

    public function get(string $path, array $handler): void
    {
        $this->routes['GET'][$path] = $handler;
    }

    public function post(string $path, array $handler): void
    {
        $this->routes['POST'][$path] = $handler;
    }

    public function dispatch(): void
    {
        try {
            $method = $_SERVER['REQUEST_METHOD'];
            $uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
            
            // Remover trailing slash e diretório base se existir
            $uri = $this->normalizeUri($uri);
            
            error_log("URI requisitada: " . $uri);
            
            if (!isset($this->routes[$method])) {
                throw new RuntimeException('Método não permitido', 405);
            }

            foreach ($this->routes[$method] as $route => $handler) {
                $pattern = $this->convertRouteToRegex($route);
                error_log("Testando rota {$route} com pattern {$pattern}");
                
                if (preg_match($pattern, $uri, $matches)) {
                    array_shift($matches); // Remove o match completo
                    
                    $controller = new $handler[0]();
                    $method = $handler[1];
                    
                    // Converter parâmetros numéricos
                    $params = array_map(function($param) {
                        return is_numeric($param) ? (int)$param : $param;
                    }, $matches);
                    
                    call_user_func_array([$controller, $method], $params);
                    return;
                }
            }

            throw new RuntimeException('Página não encontrada', 404);
        } catch (RuntimeException $e) {
            error_log("Erro no roteamento: " . $e->getMessage());
            http_response_code($e->getCode() ?: 500);
            
            // Renderizar página de erro
            extract(['message' => $e->getMessage()]);
            require __DIR__ . '/../../resources/views/error.php';
        }
    }

    private function convertRouteToRegex(string $route): string
    {
        return '#^' . preg_replace('#\{([a-zA-Z0-9_]+)\}#', '([^/]+)', $route) . '$#';
    }

    private function normalizeUri(string $uri): string
    {
        // Remover trailing slash
        $uri = rtrim($uri, '/');
        
        // Se estiver vazio, retornar /
        if (empty($uri)) {
            return '/';
        }
        
        // Remover diretório base se existir
        $basePath = dirname($_SERVER['SCRIPT_NAME']);
        if ($basePath !== '/' && strpos($uri, $basePath) === 0) {
            $uri = substr($uri, strlen($basePath));
        }
        
        return $uri ?: '/';
    }
} 
