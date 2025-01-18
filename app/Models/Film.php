<?php

declare(strict_types=1);

namespace App\Models;

class Film
{
    private int $episodeId;
    private string $title;
    private string $openingCrawl;
    private string $director;
    private string $producer;
    private string $releaseDate;
    private array $characters;

    public function __construct(array $data)
    {
        $this->episodeId = $data['episode_id'];
        $this->title = $data['title'];
        $this->openingCrawl = $data['opening_crawl'];
        $this->director = $data['director'];
        $this->producer = $data['producer'];
        $this->releaseDate = $data['release_date'];
        $this->characters = $data['characters'];
    }

    public function getEpisodeId(): int
    {
        return $this->episodeId;
    }

    public function getTitle(): string
    {
        return $this->title;
    }

    public function getOpeningCrawl(): string
    {
        return $this->openingCrawl;
    }

    public function getDirector(): string
    {
        return $this->director;
    }

    public function getProducer(): string
    {
        return $this->producer;
    }

    public function getReleaseDate(): string
    {
        return $this->releaseDate;
    }

    public function getCharacters(): array
    {
        return $this->characters;
    }

    public function toArray(): array
    {
        return [
            'episode_id' => $this->episodeId,
            'title' => $this->title,
            'opening_crawl' => $this->openingCrawl,
            'director' => $this->director,
            'producer' => $this->producer,
            'release_date' => $this->releaseDate,
            'characters' => $this->characters
        ];
    }
} 
