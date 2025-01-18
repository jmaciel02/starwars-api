<?php

declare(strict_types=1);

use App\Controllers\FilmController;
use App\Controllers\StatisticController;
use App\Controllers\FavoriteController;
use App\Controllers\TestController;

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$method = $_SERVER['REQUEST_METHOD'];

// Instanciar controladores
$filmController = new FilmController();
$statsController = new StatisticController();
$favoriteController = new FavoriteController();
$testController = new TestController();

// Rotas de filmes
if ($uri === '/films' || $uri === '/') {
    $filmController->index();
} elseif (preg_match('/^\/films\/(\d+)$/', $uri, $matches)) {
    $filmController->show((int)$matches[1]);
}
// Rotas de estatísticas
elseif ($uri === '/stats') {
    $statsController->index();
} elseif ($uri === '/stats/cache') {
    $statsController->cache();
} elseif ($uri === '/stats/errors') {
    $statsController->errors();
}
// Rota de favoritos
elseif ($uri === '/api/favorites/toggle' && $method === 'POST') {
    $favoriteController->toggle();
}
// Rota de teste
elseif ($uri === '/test/cache') {
    $testController->testCache();
} else {
    http_response_code(404);
    require __DIR__ . '/../resources/views/errors/404.php';
} 
