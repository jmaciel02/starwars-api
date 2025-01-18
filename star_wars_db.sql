-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Tempo de geração: 03-Jan-2025 às 14:19
-- Versão do servidor: 5.7.44
-- versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `star_wars_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `api_cache`
--

CREATE TABLE `api_cache` (
  `id` int(11) NOT NULL,
  `cache_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Chave Ãºnica do cache',
  `cache_value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Valor em cache',
  `expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data de expiraÃ§Ã£o',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criaÃ§Ã£o'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Cache de respostas da API';

-- --------------------------------------------------------

--
-- Estrutura da tabela `api_logs`
--

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL,
  `endpoint` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Endpoint acessado',
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'MÃ©todo HTTP',
  `request_data` text COLLATE utf8mb4_unicode_ci COMMENT 'Dados da requisiÃ§Ã£o',
  `response_code` int(11) DEFAULT NULL COMMENT 'CÃ³digo de resposta HTTP',
  `response_body` text COLLATE utf8mb4_unicode_ci COMMENT 'Corpo da resposta',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora do registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Logs de requisiÃ§Ãµes Ã  API';

-- --------------------------------------------------------

--
-- Estrutura da tabela `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `film_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `executed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `executed_at`) VALUES
(1, '001_update_statistics_table.sql', '2024-12-26 16:04:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `smart_cache`
--

CREATE TABLE `smart_cache` (
  `id` int(11) NOT NULL,
  `cache_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cache_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cache_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hits` int(11) NOT NULL DEFAULT '0',
  `last_accessed` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `smart_cache`
--

INSERT INTO `smart_cache` (`id`, `cache_key`, `cache_value`, `cache_type`, `expires_at`, `hits`, `last_accessed`, `created_at`) VALUES
(1, 'films_all', '{\"count\":7,\"next\":null,\"previous\":null,\"results\":[{\"title\":\"A New Hope\",\"episode_id\":4,\"opening_crawl\":\"It is a period of civil war.\\r\\nRebel spaceships, striking\\r\\nfrom a hidden base, have won\\r\\ntheir first victory against\\r\\nthe evil Galactic Empire.\\r\\n\\r\\nDuring the battle, Rebel\\r\\nspies managed to steal secret\\r\\nplans to the Empire\'s\\r\\nultimate weapon, the DEATH\\r\\nSTAR, an armored space\\r\\nstation with enough power\\r\\nto destroy an entire planet.\\r\\n\\r\\nPursued by the Empire\'s\\r\\nsinister agents, Princess\\r\\nLeia races home aboard her\\r\\nstarship, custodian of the\\r\\nstolen plans that can save her\\r\\npeople and restore\\r\\nfreedom to the galaxy....\",\"director\":\"George Lucas\",\"producer\":\"Gary Kurtz, Rick McCallum\",\"release_date\":\"1977-05-25\",\"characters\":[\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/4\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/5\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/7\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/8\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/9\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/12\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/13\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/14\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/15\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/16\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/18\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/19\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/81\\/\"],\"planets\":[\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/3\\/\"],\"starships\":[\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/5\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/9\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/11\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/12\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/13\\/\"],\"vehicles\":[\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/4\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/7\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/8\\/\"],\"species\":[\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/4\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/5\\/\"],\"created\":\"2014-12-10T14:23:31.880000Z\",\"edited\":\"2014-12-20T19:49:45.256000Z\",\"url\":\"https:\\/\\/swapi.py4e.com\\/api\\/films\\/1\\/\"},{\"title\":\"The Empire Strikes Back\",\"episode_id\":5,\"opening_crawl\":\"It is a dark time for the\\r\\nRebellion. Although the Death\\r\\nStar has been destroyed,\\r\\nImperial troops have driven the\\r\\nRebel forces from their hidden\\r\\nbase and pursued them across\\r\\nthe galaxy.\\r\\n\\r\\nEvading the dreaded Imperial\\r\\nStarfleet, a group of freedom\\r\\nfighters led by Luke Skywalker\\r\\nhas established a new secret\\r\\nbase on the remote ice world\\r\\nof Hoth.\\r\\n\\r\\nThe evil lord Darth Vader,\\r\\nobsessed with finding young\\r\\nSkywalker, has dispatched\\r\\nthousands of remote probes into\\r\\nthe far reaches of space....\",\"director\":\"Irvin Kershner\",\"producer\":\"Gary Kurtz, Rick McCallum\",\"release_date\":\"1980-05-17\",\"characters\":[\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/4\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/5\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/13\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/14\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/18\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/20\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/21\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/22\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/23\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/24\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/25\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/26\\/\"],\"planets\":[\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/4\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/5\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/27\\/\"],\"starships\":[\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/11\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/12\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/15\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/17\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/21\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/22\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/23\\/\"],\"vehicles\":[\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/8\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/14\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/16\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/18\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/19\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/20\\/\"],\"species\":[\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/7\\/\"],\"created\":\"2014-12-12T11:26:24.656000Z\",\"edited\":\"2014-12-15T13:07:53.386000Z\",\"url\":\"https:\\/\\/swapi.py4e.com\\/api\\/films\\/2\\/\"},{\"title\":\"Return of the Jedi\",\"episode_id\":6,\"opening_crawl\":\"Luke Skywalker has returned to\\r\\nhis home planet of Tatooine in\\r\\nan attempt to rescue his\\r\\nfriend Han Solo from the\\r\\nclutches of the vile gangster\\r\\nJabba the Hutt.\\r\\n\\r\\nLittle does Luke know that the\\r\\nGALACTIC EMPIRE has secretly\\r\\nbegun construction on a new\\r\\narmored space station even\\r\\nmore powerful than the first\\r\\ndreaded Death Star.\\r\\n\\r\\nWhen completed, this ultimate\\r\\nweapon will spell certain doom\\r\\nfor the small band of rebels\\r\\nstruggling to restore freedom\\r\\nto the galaxy...\",\"director\":\"Richard Marquand\",\"producer\":\"Howard G. Kazanjian, George Lucas, Rick McCallum\",\"release_date\":\"1983-05-25\",\"characters\":[\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/4\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/5\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/13\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/14\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/16\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/18\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/20\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/21\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/22\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/25\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/27\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/28\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/29\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/30\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/31\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/45\\/\"],\"planets\":[\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/5\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/7\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/8\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/9\\/\"],\"starships\":[\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/11\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/12\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/15\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/17\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/22\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/23\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/27\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/28\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/29\\/\"],\"vehicles\":[\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/8\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/16\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/18\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/19\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/24\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/25\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/26\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/30\\/\"],\"species\":[\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/5\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/8\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/9\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/15\\/\"],\"created\":\"2014-12-18T10:39:33.255000Z\",\"edited\":\"2014-12-20T09:48:37.462000Z\",\"url\":\"https:\\/\\/swapi.py4e.com\\/api\\/films\\/3\\/\"},{\"title\":\"The Phantom Menace\",\"episode_id\":1,\"opening_crawl\":\"Turmoil has engulfed the\\r\\nGalactic Republic. The taxation\\r\\nof trade routes to outlying star\\r\\nsystems is in dispute.\\r\\n\\r\\nHoping to resolve the matter\\r\\nwith a blockade of deadly\\r\\nbattleships, the greedy Trade\\r\\nFederation has stopped all\\r\\nshipping to the small planet\\r\\nof Naboo.\\r\\n\\r\\nWhile the Congress of the\\r\\nRepublic endlessly debates\\r\\nthis alarming chain of events,\\r\\nthe Supreme Chancellor has\\r\\nsecretly dispatched two Jedi\\r\\nKnights, the guardians of\\r\\npeace and justice in the\\r\\ngalaxy, to settle the conflict....\",\"director\":\"George Lucas\",\"producer\":\"Rick McCallum\",\"release_date\":\"1999-05-19\",\"characters\":[\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/11\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/16\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/20\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/21\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/32\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/33\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/34\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/35\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/36\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/37\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/38\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/39\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/40\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/41\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/42\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/43\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/44\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/46\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/47\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/48\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/49\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/50\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/51\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/52\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/53\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/54\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/55\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/56\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/57\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/58\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/59\\/\"],\"planets\":[\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/8\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/9\\/\"],\"starships\":[\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/31\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/32\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/39\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/40\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/41\\/\"],\"vehicles\":[\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/33\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/34\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/35\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/36\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/37\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/38\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/42\\/\"],\"species\":[\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/11\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/12\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/13\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/14\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/15\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/16\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/17\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/18\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/19\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/20\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/21\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/22\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/23\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/24\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/25\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/26\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/27\\/\"],\"created\":\"2014-12-19T16:52:55.740000Z\",\"edited\":\"2014-12-20T10:54:07.216000Z\",\"url\":\"https:\\/\\/swapi.py4e.com\\/api\\/films\\/4\\/\"},{\"title\":\"Attack of the Clones\",\"episode_id\":2,\"opening_crawl\":\"There is unrest in the Galactic\\r\\nSenate. Several thousand solar\\r\\nsystems have declared their\\r\\nintentions to leave the Republic.\\r\\n\\r\\nThis separatist movement,\\r\\nunder the leadership of the\\r\\nmysterious Count Dooku, has\\r\\nmade it difficult for the limited\\r\\nnumber of Jedi Knights to maintain \\r\\npeace and order in the galaxy.\\r\\n\\r\\nSenator Amidala, the former\\r\\nQueen of Naboo, is returning\\r\\nto the Galactic Senate to vote\\r\\non the critical issue of creating\\r\\nan ARMY OF THE REPUBLIC\\r\\nto assist the overwhelmed\\r\\nJedi....\",\"director\":\"George Lucas\",\"producer\":\"Rick McCallum\",\"release_date\":\"2002-05-16\",\"characters\":[\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/7\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/11\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/20\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/21\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/22\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/33\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/35\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/36\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/40\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/43\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/46\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/51\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/52\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/53\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/58\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/59\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/60\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/61\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/62\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/63\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/64\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/65\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/66\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/67\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/68\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/69\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/70\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/71\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/72\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/73\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/74\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/75\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/76\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/77\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/78\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/82\\/\"],\"planets\":[\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/8\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/9\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/11\\/\"],\"starships\":[\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/21\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/32\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/39\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/43\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/47\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/48\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/49\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/52\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/58\\/\"],\"vehicles\":[\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/4\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/44\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/45\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/46\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/50\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/51\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/53\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/54\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/55\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/56\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/57\\/\"],\"species\":[\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/12\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/13\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/15\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/28\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/29\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/30\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/31\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/32\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/33\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/34\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/35\\/\"],\"created\":\"2014-12-20T10:57:57.886000Z\",\"edited\":\"2014-12-20T20:18:48.516000Z\",\"url\":\"https:\\/\\/swapi.py4e.com\\/api\\/films\\/5\\/\"},{\"title\":\"Revenge of the Sith\",\"episode_id\":3,\"opening_crawl\":\"War! The Republic is crumbling\\r\\nunder attacks by the ruthless\\r\\nSith Lord, Count Dooku.\\r\\nThere are heroes on both sides.\\r\\nEvil is everywhere.\\r\\n\\r\\nIn a stunning move, the\\r\\nfiendish droid leader, General\\r\\nGrievous, has swept into the\\r\\nRepublic capital and kidnapped\\r\\nChancellor Palpatine, leader of\\r\\nthe Galactic Senate.\\r\\n\\r\\nAs the Separatist Droid Army\\r\\nattempts to flee the besieged\\r\\ncapital with their valuable\\r\\nhostage, two Jedi Knights lead a\\r\\ndesperate mission to rescue the\\r\\ncaptive Chancellor....\",\"director\":\"George Lucas\",\"producer\":\"Rick McCallum\",\"release_date\":\"2005-05-19\",\"characters\":[\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/4\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/5\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/7\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/11\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/12\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/13\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/20\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/21\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/33\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/35\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/46\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/51\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/52\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/53\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/54\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/55\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/56\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/58\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/63\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/64\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/67\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/68\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/75\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/78\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/79\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/80\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/81\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/82\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/83\\/\"],\"planets\":[\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/5\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/8\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/9\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/12\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/13\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/14\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/15\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/16\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/17\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/18\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/19\\/\"],\"starships\":[\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/32\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/48\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/59\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/61\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/63\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/64\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/65\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/66\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/68\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/74\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/75\\/\"],\"vehicles\":[\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/33\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/50\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/53\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/56\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/60\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/62\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/67\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/69\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/70\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/71\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/72\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/73\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/76\\/\"],\"species\":[\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/15\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/19\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/20\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/23\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/24\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/25\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/26\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/27\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/28\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/29\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/30\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/33\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/34\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/35\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/36\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/37\\/\"],\"created\":\"2014-12-20T18:49:38.403000Z\",\"edited\":\"2014-12-20T20:47:52.073000Z\",\"url\":\"https:\\/\\/swapi.py4e.com\\/api\\/films\\/6\\/\"},{\"title\":\"The Force Awakens\",\"episode_id\":7,\"opening_crawl\":\"Luke Skywalker has vanished.\\r\\nIn his absence, the sinister\\r\\nFIRST ORDER has risen from\\r\\nthe ashes of the Empire\\r\\nand will not rest until\\r\\nSkywalker, the last Jedi,\\r\\nhas been destroyed.\\r\\n \\r\\nWith the support of the\\r\\nREPUBLIC, General Leia Organa\\r\\nleads a brave RESISTANCE.\\r\\nShe is desperate to find her\\r\\nbrother Luke and gain his\\r\\nhelp in restoring peace and\\r\\njustice to the galaxy.\\r\\n \\r\\nLeia has sent her most daring\\r\\npilot on a secret mission\\r\\nto Jakku, where an old ally\\r\\nhas discovered a clue to\\r\\nLuke\'s whereabouts....\",\"director\":\"J. J. Abrams\",\"producer\":\"Kathleen Kennedy, J. J. Abrams, Bryan Burk\",\"release_date\":\"2015-12-11\",\"characters\":[\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/5\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/13\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/14\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/27\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/84\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/85\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/86\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/87\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/88\\/\"],\"planets\":[\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/61\\/\"],\"starships\":[\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/77\\/\"],\"vehicles\":[],\"species\":[\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/3\\/\"],\"created\":\"2015-04-17T06:51:30.504780Z\",\"edited\":\"2015-12-17T14:31:47.617768Z\",\"url\":\"https:\\/\\/swapi.py4e.com\\/api\\/films\\/7\\/\"}]}', 'films', '2025-01-03 12:19:17', 0, NULL, '2025-01-03 14:19:17'),
(2, 'film_1', '{\"title\":\"The Phantom Menace\",\"episode_id\":1,\"opening_crawl\":\"Turmoil has engulfed the\\r\\nGalactic Republic. The taxation\\r\\nof trade routes to outlying star\\r\\nsystems is in dispute.\\r\\n\\r\\nHoping to resolve the matter\\r\\nwith a blockade of deadly\\r\\nbattleships, the greedy Trade\\r\\nFederation has stopped all\\r\\nshipping to the small planet\\r\\nof Naboo.\\r\\n\\r\\nWhile the Congress of the\\r\\nRepublic endlessly debates\\r\\nthis alarming chain of events,\\r\\nthe Supreme Chancellor has\\r\\nsecretly dispatched two Jedi\\r\\nKnights, the guardians of\\r\\npeace and justice in the\\r\\ngalaxy, to settle the conflict....\",\"director\":\"George Lucas\",\"producer\":\"Rick McCallum\",\"release_date\":\"1999-05-19\",\"characters\":[\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/3\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/10\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/11\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/16\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/20\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/21\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/32\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/33\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/34\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/35\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/36\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/37\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/38\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/39\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/40\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/41\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/42\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/43\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/44\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/46\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/47\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/48\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/49\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/50\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/51\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/52\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/53\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/54\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/55\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/56\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/57\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/58\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/people\\/59\\/\"],\"planets\":[\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/8\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/planets\\/9\\/\"],\"starships\":[\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/31\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/32\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/39\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/40\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/starships\\/41\\/\"],\"vehicles\":[\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/33\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/34\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/35\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/36\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/37\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/38\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/vehicles\\/42\\/\"],\"species\":[\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/1\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/2\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/6\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/11\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/12\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/13\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/14\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/15\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/16\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/17\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/18\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/19\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/20\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/21\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/22\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/23\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/24\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/25\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/26\\/\",\"https:\\/\\/swapi.py4e.com\\/api\\/species\\/27\\/\"],\"created\":\"2014-12-19T16:52:55.740000Z\",\"edited\":\"2014-12-20T10:54:07.216000Z\",\"url\":\"https:\\/\\/swapi.py4e.com\\/api\\/films\\/4\\/\"}', 'film', '2025-01-03 12:19:17', 0, NULL, '2025-01-03 14:19:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `statistics`
--

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tipo do evento (api_call, cache_hit, cache_miss, error)',
  `details` json DEFAULT NULL COMMENT 'Detalhes do evento em formato JSON',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `statistics`
--

INSERT INTO `statistics` (`id`, `type`, `details`, `created_at`) VALUES
(1, 'api_call', '{\"error\": null, \"endpoint\": \"/films/\", \"status_code\": 200, \"response_time\": 145}', '2025-01-03 14:19:17'),
(2, 'cache_miss', '{\"key\": \"films_all\", \"type\": \"films\"}', '2025-01-03 14:19:17'),
(3, 'cache_miss', '{\"key\": \"film_1\", \"type\": \"film\"}', '2025-01-03 14:19:17'),
(4, 'cache_miss', '{\"key\": \"film_1\", \"type\": \"film\"}', '2025-01-03 14:19:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `statistics_backup`
--

CREATE TABLE `statistics_backup` (
  `id` int(11) NOT NULL DEFAULT '0',
  `event_type` enum('page_view','api_call','error','cache_hit','cache_miss') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_data` json NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `statistics_backup`
--

INSERT INTO `statistics_backup` (`id`, `event_type`, `event_data`, `created_at`) VALUES
(1, 'api_call', '{\"error\": null, \"endpoint\": \"/films/\", \"status_code\": 200, \"response_time\": 134.79}', '2024-12-26 15:49:59'),
(2, 'cache_miss', '{\"key\": \"films_all\", \"type\": \"films\"}', '2024-12-26 15:49:59'),
(3, 'api_call', '{\"error\": null, \"endpoint\": \"/films/\", \"status_code\": 200, \"response_time\": 135.13}', '2024-12-26 15:50:00'),
(4, 'cache_miss', '{\"key\": \"films_all\", \"type\": \"films\"}', '2024-12-26 15:50:00'),
(5, 'api_call', '{\"error\": null, \"endpoint\": \"/films/\", \"status_code\": 200, \"response_time\": 132.15}', '2024-12-26 15:50:16'),
(6, 'cache_miss', '{\"key\": \"films_all\", \"type\": \"films\"}', '2024-12-26 15:50:16'),
(7, 'api_call', '{\"error\": null, \"endpoint\": \"/films/4/\", \"status_code\": 200, \"response_time\": 167.43}', '2024-12-26 15:50:25'),
(8, 'cache_miss', '{\"id\": 4, \"type\": \"film\"}', '2024-12-26 15:50:25'),
(9, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 207.59}', '2024-12-26 15:50:25'),
(10, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/2/\", \"type\": \"character\"}', '2024-12-26 15:50:25'),
(11, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 138.58}', '2024-12-26 15:50:25'),
(12, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/3/\", \"type\": \"character\"}', '2024-12-26 15:50:25'),
(13, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 133.55}', '2024-12-26 15:50:26'),
(14, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/10/\", \"type\": \"character\"}', '2024-12-26 15:50:26'),
(15, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 129.79}', '2024-12-26 15:50:26'),
(16, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/11/\", \"type\": \"character\"}', '2024-12-26 15:50:26'),
(17, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 131.57}', '2024-12-26 15:50:26'),
(18, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/16/\", \"type\": \"character\"}', '2024-12-26 15:50:26'),
(19, 'api_call', '{\"error\": null, \"endpoint\": \"/films/\", \"status_code\": 200, \"response_time\": 134.73}', '2024-12-26 15:50:29'),
(20, 'cache_miss', '{\"key\": \"films_all\", \"type\": \"films\"}', '2024-12-26 15:50:29'),
(21, 'api_call', '{\"error\": null, \"endpoint\": \"/films/5/\", \"status_code\": 200, \"response_time\": 135.85}', '2024-12-26 15:50:30'),
(22, 'cache_miss', '{\"id\": 5, \"type\": \"film\"}', '2024-12-26 15:50:30'),
(23, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 150.94}', '2024-12-26 15:50:30'),
(24, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/2/\", \"type\": \"character\"}', '2024-12-26 15:50:30'),
(25, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 138.18}', '2024-12-26 15:50:30'),
(26, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/3/\", \"type\": \"character\"}', '2024-12-26 15:50:30'),
(27, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 133.14}', '2024-12-26 15:50:31'),
(28, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/6/\", \"type\": \"character\"}', '2024-12-26 15:50:31'),
(29, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 196.78}', '2024-12-26 15:50:31'),
(30, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/7/\", \"type\": \"character\"}', '2024-12-26 15:50:31'),
(31, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 133.29}', '2024-12-26 15:50:31'),
(32, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/10/\", \"type\": \"character\"}', '2024-12-26 15:50:31'),
(33, 'api_call', '{\"error\": null, \"endpoint\": \"/films/\", \"status_code\": 200, \"response_time\": 140.66}', '2024-12-26 15:50:32'),
(34, 'cache_miss', '{\"key\": \"films_all\", \"type\": \"films\"}', '2024-12-26 15:50:32'),
(35, 'api_call', '{\"error\": null, \"endpoint\": \"/films/4/\", \"status_code\": 200, \"response_time\": 142.72}', '2024-12-26 15:50:43'),
(36, 'cache_miss', '{\"id\": 4, \"type\": \"film\"}', '2024-12-26 15:50:43'),
(37, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 125.45}', '2024-12-26 15:50:43'),
(38, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/2/\", \"type\": \"character\"}', '2024-12-26 15:50:43'),
(39, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 154.02}', '2024-12-26 15:50:43'),
(40, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/3/\", \"type\": \"character\"}', '2024-12-26 15:50:43'),
(41, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 130.82}', '2024-12-26 15:50:43'),
(42, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/10/\", \"type\": \"character\"}', '2024-12-26 15:50:43'),
(43, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 124.95}', '2024-12-26 15:50:43'),
(44, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/11/\", \"type\": \"character\"}', '2024-12-26 15:50:43'),
(45, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 132.06}', '2024-12-26 15:50:43'),
(46, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/16/\", \"type\": \"character\"}', '2024-12-26 15:50:43'),
(47, 'api_call', '{\"error\": null, \"endpoint\": \"/films/\", \"status_code\": 200, \"response_time\": 127.8}', '2024-12-26 15:50:45'),
(48, 'cache_miss', '{\"key\": \"films_all\", \"type\": \"films\"}', '2024-12-26 15:50:45'),
(49, 'api_call', '{\"error\": null, \"endpoint\": \"/films/1/\", \"status_code\": 200, \"response_time\": 137.82}', '2024-12-26 15:50:46'),
(50, 'cache_miss', '{\"id\": 1, \"type\": \"film\"}', '2024-12-26 15:50:46'),
(51, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 133.06}', '2024-12-26 15:50:46'),
(52, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/1/\", \"type\": \"character\"}', '2024-12-26 15:50:46'),
(53, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 130.02}', '2024-12-26 15:50:47'),
(54, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/2/\", \"type\": \"character\"}', '2024-12-26 15:50:47'),
(55, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 125.57}', '2024-12-26 15:50:47'),
(56, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/3/\", \"type\": \"character\"}', '2024-12-26 15:50:47'),
(57, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 138.46}', '2024-12-26 15:50:47'),
(58, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/4/\", \"type\": \"character\"}', '2024-12-26 15:50:47'),
(59, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 156.45}', '2024-12-26 15:50:47'),
(60, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/5/\", \"type\": \"character\"}', '2024-12-26 15:50:47'),
(61, 'api_call', '{\"error\": null, \"endpoint\": \"/films/\", \"status_code\": 200, \"response_time\": 136.67}', '2024-12-26 15:50:49'),
(62, 'cache_miss', '{\"key\": \"films_all\", \"type\": \"films\"}', '2024-12-26 15:50:49'),
(63, 'api_call', '{\"error\": null, \"endpoint\": \"/films/4/\", \"status_code\": 200, \"response_time\": 136.59}', '2024-12-26 15:51:12'),
(64, 'cache_miss', '{\"id\": 4, \"type\": \"film\"}', '2024-12-26 15:51:12'),
(65, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 135.45}', '2024-12-26 15:51:12'),
(66, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/2/\", \"type\": \"character\"}', '2024-12-26 15:51:12'),
(67, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 134.35}', '2024-12-26 15:51:13'),
(68, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/3/\", \"type\": \"character\"}', '2024-12-26 15:51:13'),
(69, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 147.86}', '2024-12-26 15:51:13'),
(70, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/10/\", \"type\": \"character\"}', '2024-12-26 15:51:13'),
(71, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 131.03}', '2024-12-26 15:51:13'),
(72, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/11/\", \"type\": \"character\"}', '2024-12-26 15:51:13'),
(73, 'api_call', '{\"error\": null, \"endpoint\": \"\", \"status_code\": 200, \"response_time\": 162.96}', '2024-12-26 15:51:13'),
(74, 'cache_miss', '{\"url\": \"https://swapi.py4e.com/api/people/16/\", \"type\": \"character\"}', '2024-12-26 15:51:13'),
(75, 'api_call', '{\"error\": null, \"endpoint\": \"/films/\", \"status_code\": 200, \"response_time\": 194.74}', '2024-12-26 15:51:15'),
(76, 'cache_miss', '{\"key\": \"films_all\", \"type\": \"films\"}', '2024-12-26 15:51:15'),
(77, 'api_call', '{\"error\": null, \"endpoint\": \"/films/\", \"status_code\": 200, \"response_time\": 165.83}', '2024-12-26 15:51:30'),
(78, 'cache_miss', '{\"key\": \"films_all\", \"type\": \"films\"}', '2024-12-26 15:51:30');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `api_cache`
--
ALTER TABLE `api_cache`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cache_key` (`cache_key`),
  ADD KEY `idx_expires_at` (`expires_at`);

--
-- Índices para tabela `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_endpoint` (`endpoint`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Índices para tabela `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_film_id` (`film_id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `smart_cache`
--
ALTER TABLE `smart_cache`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cache_key` (`cache_key`);

--
-- Índices para tabela `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_statistics_type` (`type`),
  ADD KEY `idx_statistics_created_at` (`created_at`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `api_cache`
--
ALTER TABLE `api_cache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=497;

--
-- AUTO_INCREMENT de tabela `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `smart_cache`
--
ALTER TABLE `smart_cache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
