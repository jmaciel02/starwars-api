<?php

declare(strict_types=1);

require_once __DIR__ . '/../public/index.php';

use App\Services\StarWarsApiClient;
use App\Models\Statistic;

// Limpar as tabelas
$db = \App\Helpers\Database::getInstance();
$db->exec("TRUNCATE TABLE smart_cache");
$db->exec("TRUNCATE TABLE statistics");

echo "Tabelas limpas.\n\n";

// Instanciar o cliente
$client = new StarWarsApiClient();
$statistic = new Statistic();

// Teste 1: Primeira chamada (deve gerar cache miss)
echo "Teste 1: Primeira chamada para filme 1\n";
$film = $client->getFilm(1);
echo "Cache misses: " . $statistic->getCacheMisses() . "\n";
echo "Cache hits: " . $statistic->getCacheHits() . "\n\n";

// Teste 2: Segunda chamada (deve gerar cache hit)
echo "Teste 2: Segunda chamada para filme 1\n";
$film = $client->getFilm(1);
echo "Cache misses: " . $statistic->getCacheMisses() . "\n";
echo "Cache hits: " . $statistic->getCacheHits() . "\n\n";

// Teste 3: Verificar dados no cache
$sql = "SELECT * FROM smart_cache WHERE cache_key = 'film_1'";
$result = $db->query($sql)->fetch(PDO::FETCH_ASSOC);
echo "Dados no cache:\n";
print_r($result);
echo "\n";

// Teste 4: Verificar estatísticas
$sql = "SELECT * FROM statistics ORDER BY created_at DESC LIMIT 5";
$result = $db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
echo "Últimas estatísticas:\n";
print_r($result); 
