<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\Statistic;
use App\Models\SmartCache;
use App\Repositories\SmartCacheRepository;
use App\Repositories\StatisticRepository;
use App\Repositories\ApiLogRepository;
use RuntimeException;

class StarWarsApiClient
{
    private const API_BASE_URL = 'https://swapi.py4e.com/api';
   
    private SmartCacheRepository $cacheRepository;
    private StatisticRepository $statisticRepository;
    private ApiLogRepository $apiLogRepository;
    private array $filmsCache = [];

    public function __construct(SmartCacheRepository $cacheRepository, StatisticRepository $statisticRepository, ApiLogRepository $apiLogRepository)
    {
        $this->cacheRepository = $cacheRepository;
        $this->statisticRepository = $statisticRepository;
        $this->apiLogRepository = $apiLogRepository;
    }

    public function getAllFilms(): array
    {
        $cacheKey = 'films_all';
        
        // Tentar obter do cache
        $cached = $this->cacheRepository->get($cacheKey);
        if ($cached instanceof SmartCache) {
            $this->filmsCache = $cached->getData();
            return $cached->getData();
        }

        try {
            $response = $this->makeRequest('/films/');
            if (!isset($response['results'])) {
                throw new RuntimeException('Formato de resposta inválido da API');
            }

            // Salvar no cache
            $this->cacheRepository->set($cacheKey, $response, 'films', 3600);
            $this->filmsCache = $response;

            return $response;
        } catch (RuntimeException $e) {
            /*$this->statisticRepository->log('error', [
                'type' => 'films',
                'message' => $e->getMessage()
            ]);*/
            $this->logError('films', $e->getMessage());
            throw $e;
        }
    }

    public function getFilm(int $episodeId): array
    {
        $cacheKey = "film_{$episodeId}";
        
        // Tentar obter do cache primeiro
        $cached = $this->cacheRepository->get($cacheKey);
        if ($cached instanceof SmartCache) {
            return $cached->getData();
        }

        // Se não temos os filmes em cache, buscar todos
        if (empty($this->filmsCache)) {
            $this->getAllFilms();
        }

        // Procurar o filme no cache de filmes
        $filmData = null;
        foreach ($this->filmsCache['results'] as $film) {
            if ($film['episode_id'] === $episodeId) {
                $filmData = $film;
                break;
            }
        }

        if (!$filmData) {
            throw new RuntimeException("Filme com episode_id {$episodeId} não encontrado");
        }

        // Salvar no cache individual
        $this->cacheRepository->set($cacheKey, $filmData, 'film', 3600);

        return $filmData;
    }

    public function getCharacter(string $url): array
    {
        $cacheKey = "character_" . md5($url);
        
        // Tentar obter do cache
        $cached = $this->cacheRepository->get($cacheKey);
        if ($cached instanceof SmartCache) {
            return $cached->getData();
        }

        try {
            $response = $this->makeRequest('', $url);
            
            // Salvar no cache
            $this->cacheRepository->set($cacheKey, $response, 'character', 3600);

            return $response;
        } catch (RuntimeException $e) {
            $this->logError('character', $e->getMessage(), ['url' => $url]);
            /*$this->statisticRepository->log('error', [
                'type' => 'character',
                'url' => $url,
                'message' => $e->getMessage()
            ]);*/
            throw $e;
        }
    }

    private function makeRequest(string $endpoint, string $fullUrl = ''): array
    {
        $url = $fullUrl ?: self::API_BASE_URL . $endpoint;
        $curl = curl_init($url);

        if ($curl === false) {
            throw new RuntimeException('Failed to initialize cURL');
        }

        curl_setopt_array($curl, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_FOLLOWLOCATION => true
        ]);

        $startTime = microtime(true);
        $response = curl_exec($curl);
        $endTime = microtime(true);

        $statusCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);

        $requestData = [
            'url' => $url,
            'parameters' => parse_url($url, PHP_URL_QUERY) ?? null
        ];
    

        // Registrar log da API
        $this->apiLogRepository->log(
            $endpoint ?: $fullUrl,
            'GET',
            $requestData,
            $statusCode,
            $response !== false ? $response : null
        );

        $this->logApiCall($endpoint, $statusCode, $endTime - $startTime);
    


        if ($response === false) {
            $error = curl_error($curl);
           
            curl_close($curl);
            $this->logError('api_call', $error);
            /*$this->statistic->log('api_call', [
                'endpoint' => $endpoint,
                'status_code' => $statusCode,
                'response_time' => round(($endTime - $startTime) * 1000, 2),
                'error' => $error
            ]);*/

            throw new RuntimeException("cURL Error: {$error}");
        }

      
        curl_close($curl);

        if ($statusCode !== 200) {
            throw new RuntimeException(
                "API request failed with status code: {$statusCode}"
            );
        }

        $decodedResponse = json_decode($response, true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new RuntimeException(
                'Failed to decode API response: ' . json_last_error_msg()
            );
        }

        return $decodedResponse;
    }

    private function logApiCall(string $endpoint, int $statusCode, float $responseTime): void
    {
        $this->statisticRepository->log(new Statistic('api_call', [
            'endpoint' => $endpoint,
            'status_code' => $statusCode,
            'response_time' => round($responseTime * 1000, 2),
            'success' => $statusCode === 200
        ]));
    }

    private function logError(string $type, string $message, array $context = []): void
    {
        $this->statisticRepository->log(new Statistic('error', array_merge([
            'type' => $type,
            'message' => $message
        ], $context)));
    }

    public function calculateMovieAge(string $releaseDate): array
    {
        $release = new \DateTime($releaseDate);
        $now = new \DateTime();
        $interval = $release->diff($now);

        return [
            'years' => $interval->y,
            'months' => $interval->m,
            'days' => $interval->d
        ];
    }
}
