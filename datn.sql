-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 01, 2023 at 12:12 AM
-- Server version: 8.0.32
-- PHP Version: 8.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datn`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `visibility`, `created_at`, `updated_at`) VALUES
(17, '1', 0, '2023-08-29 07:34:17', '2023-08-29 07:34:17'),
(18, '2', 0, '2023-09-05 02:48:04', '2023-09-05 02:48:04'),
(19, '3', 0, '2023-09-05 02:48:37', '2023-09-05 02:48:37'),
(20, '4', 0, '2023-09-05 02:49:05', '2023-09-05 02:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(34, '2c4be250-6c6a-490e-aa57-d3baaa879a8d', 'database', 'default', '{\"uuid\":\"2c4be250-6c6a-490e-aa57-d3baaa879a8d\",\"displayName\":\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:60:\\\"Illuminate\\\\Notifications\\\\Events\\\\BroadcastNotificationCreated\\\":3:{s:10:\\\"notifiable\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:44:\\\"Filament\\\\Notifications\\\\BroadcastNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:2:\\\"id\\\";s:36:\\\"9a0f737a-ec7b-440f-b2df-5c6323bba1f7\\\";s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";i:6000;s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:5:\\\"title\\\";s:2:\\\"cc\\\";s:4:\\\"view\\\";s:36:\\\"filament-notifications::notification\\\";s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"d9f2ab78-c1ea-4fd9-ad8f-3239863e8255\\\";}s:4:\\\"data\\\";a:11:{s:2:\\\"id\\\";s:36:\\\"9a0f737a-ec7b-440f-b2df-5c6323bba1f7\\\";s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";i:6000;s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:5:\\\"title\\\";s:2:\\\"cc\\\";s:4:\\\"view\\\";s:36:\\\"filament-notifications::notification\\\";s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'GuzzleHttp\\Exception\\RequestException: cURL error 60: SSL certificate problem: self-signed certificate (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://datn.test/apps/1658573/events?auth_key=9f1845f82bcb0ee5c12a&auth_timestamp=1693911528&auth_version=1.0&body_md5=9977df348ea8a1aba518db064db64bbc&auth_signature=2bf5020becb62e443248d32d1e87848a11ebd340bdc738f61d69196b16f6ba5f in C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php:211\nStack trace:\n#0 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(158): GuzzleHttp\\Handler\\CurlFactory::createRejection()\n#1 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlFactory.php(110): GuzzleHttp\\Handler\\CurlFactory::finishError()\n#2 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\CurlHandler.php(47): GuzzleHttp\\Handler\\CurlFactory::finish()\n#3 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(28): GuzzleHttp\\Handler\\CurlHandler->__invoke()\n#4 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Handler\\Proxy.php(48): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}()\n#5 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\PrepareBodyMiddleware.php(64): GuzzleHttp\\Handler\\Proxy::GuzzleHttp\\Handler\\{closure}()\n#6 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(31): GuzzleHttp\\PrepareBodyMiddleware->__invoke()\n#7 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\RedirectMiddleware.php(71): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}()\n#8 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Middleware.php(63): GuzzleHttp\\RedirectMiddleware->__invoke()\n#9 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\HandlerStack.php(75): GuzzleHttp\\Middleware::GuzzleHttp\\{closure}()\n#10 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(333): GuzzleHttp\\HandlerStack->__invoke()\n#11 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(169): GuzzleHttp\\Client->transfer()\n#12 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\Client.php(189): GuzzleHttp\\Client->requestAsync()\n#13 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\guzzlehttp\\guzzle\\src\\ClientTrait.php(95): GuzzleHttp\\Client->request()\n#14 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\pusher\\pusher-php-server\\src\\Pusher.php(774): GuzzleHttp\\Client->post()\n#15 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\pusher\\pusher-php-server\\src\\Pusher.php(440): Pusher\\Pusher->post()\n#16 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php(161): Pusher\\Pusher->trigger()\n#17 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Collections\\Traits\\EnumeratesValues.php(236): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->Illuminate\\Broadcasting\\Broadcasters\\{closure}()\n#18 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster.php(160): Illuminate\\Support\\Collection->each()\n#19 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Broadcasting\\BroadcastEvent.php(92): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast()\n#20 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle()\n#21 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#23 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#24 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#25 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#26 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#27 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#29 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#30 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#31 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#32 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#33 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#34 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#35 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#36 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process()\n#37 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#38 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#39 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#40 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#41 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#42 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#43 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#44 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#45 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call()\n#46 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\symfony\\console\\Command\\Command.php(326): Illuminate\\Console\\Command->execute()\n#47 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#48 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\symfony\\console\\Application.php(1081): Illuminate\\Console\\Command->run()\n#49 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\symfony\\console\\Application.php(320): Symfony\\Component\\Console\\Application->doRunCommand()\n#50 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\symfony\\console\\Application.php(174): Symfony\\Component\\Console\\Application->doRun()\n#51 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#52 C:\\Users\\Admin\\OneDrive\\Documents\\code\\datn\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#53 {main}', '2023-09-05 10:58:49');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(310, 'default', '{\"uuid\":\"2ed166cc-cc21-48cf-b2c0-72b29afd6f69\",\"displayName\":\"Filament\\\\Notifications\\\\BroadcastNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:8;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:44:\\\"Filament\\\\Notifications\\\\BroadcastNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:2:\\\"id\\\";s:36:\\\"9a296173-595b-47e9-83c6-40f88ec20136\\\";s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";i:6000;s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:5:\\\"title\\\";s:2:\\\"cc\\\";s:4:\\\"view\\\";s:36:\\\"filament-notifications::notification\\\";s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"02112146-69b8-4ed1-bc50-1895ebc98638\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}}\"}}', 0, NULL, 1695025192, 1695025192),
(311, 'default', '{\"uuid\":\"3973eef0-bd5a-4b09-ace5-960f24516af1\",\"displayName\":\"App\\\\Notifications\\\\VerifyEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:12;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:29:\\\"App\\\\Notifications\\\\VerifyEmail\\\":2:{s:35:\\\"\\u0000App\\\\Notifications\\\\VerifyEmail\\u0000code\\\";i:53959;s:2:\\\"id\\\";s:36:\\\"a2e8a43f-353e-4a2a-874a-7fcbb82d1a06\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}', 0, NULL, 1695025422, 1695025422),
(312, 'default', '{\"uuid\":\"cfdf8b9d-ec19-4d16-8953-2fc13975a809\",\"displayName\":\"Filament\\\\Notifications\\\\DatabaseNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:12;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:43:\\\"Filament\\\\Notifications\\\\DatabaseNotification\\\":2:{s:4:\\\"data\\\";a:10:{s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";s:10:\\\"persistent\\\";s:4:\\\"icon\\\";s:23:\\\"heroicon-o-shopping-bag\\\";s:9:\\\"iconColor\\\";N;s:5:\\\"title\\\";s:9:\\\"New order\\\";s:4:\\\"view\\\";s:36:\\\"filament-notifications::notification\\\";s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"69eacd74-8c50-4b3b-b746-c8e53050b473\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}}\"}}', 0, NULL, 1695025422, 1695025422),
(313, 'default', '{\"uuid\":\"fa15bb6a-dc6e-44b8-a665-35dceff45713\",\"displayName\":\"Filament\\\\Notifications\\\\BroadcastNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:8;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:44:\\\"Filament\\\\Notifications\\\\BroadcastNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:2:\\\"id\\\";s:36:\\\"9a2962ff-dcd9-4aa0-bba2-b4b250df1df0\\\";s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";i:6000;s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:5:\\\"title\\\";s:2:\\\"cc\\\";s:4:\\\"view\\\";s:36:\\\"filament-notifications::notification\\\";s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"c5f5ff0f-fbf1-4199-b98a-2805cc7a6810\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}}\"}}', 0, NULL, 1695025452, 1695025452),
(314, 'default', '{\"uuid\":\"30e48f2e-07d6-4e63-a6db-8eeee556d05b\",\"displayName\":\"Filament\\\\Notifications\\\\BroadcastNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:8;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:44:\\\"Filament\\\\Notifications\\\\BroadcastNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:2:\\\"id\\\";s:36:\\\"9a2964c0-f1ab-42a4-92be-61e7eb6722c8\\\";s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";i:6000;s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:5:\\\"title\\\";s:2:\\\"cc\\\";s:4:\\\"view\\\";s:36:\\\"filament-notifications::notification\\\";s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"318391de-6c1d-44ef-b012-992d376e29c1\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}}\"}}', 0, NULL, 1695025747, 1695025747),
(315, 'default', '{\"uuid\":\"f5fed747-4317-402a-8dcf-d991228238e1\",\"displayName\":\"Filament\\\\Notifications\\\\BroadcastNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:8;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:44:\\\"Filament\\\\Notifications\\\\BroadcastNotification\\\":2:{s:4:\\\"data\\\";a:11:{s:2:\\\"id\\\";s:36:\\\"9a2b03e0-6fbd-437c-a894-bb7bd01a09b3\\\";s:7:\\\"actions\\\";a:0:{}s:4:\\\"body\\\";N;s:5:\\\"color\\\";N;s:8:\\\"duration\\\";i:6000;s:4:\\\"icon\\\";N;s:9:\\\"iconColor\\\";N;s:5:\\\"title\\\";s:2:\\\"cc\\\";s:4:\\\"view\\\";s:36:\\\"filament-notifications::notification\\\";s:8:\\\"viewData\\\";a:0:{}s:6:\\\"format\\\";s:8:\\\"filament\\\";}s:2:\\\"id\\\";s:36:\\\"638672a8-e4e4-43fe-82e9-6d2327dbed8d\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:9:\\\"broadcast\\\";}}\"}}', 0, NULL, 1695095393, 1695095393);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_25_084247_create_notifications_table', 2),
(6, '2023_08_25_084456_create_category_table', 3),
(7, '2023_08_25_084645_create_categories_table', 4),
(8, '2023_08_12_063618_create_products_table', 5),
(9, '2023_08_21_083158_create_jobs_table', 5),
(10, '2023_08_25_090201_add_code_to_users_table', 6),
(11, '2023_08_28_142839_create_permission_tables', 7),
(12, '2023_08_31_101018_create_media_table', 8),
(13, '2023_09_06_101222_add_role_column_to_users_table', 9),
(14, '2023_09_15_152507_add_column_to_products_table', 10),
(15, '2023_09_18_143619_create_carts_table', 11),
(16, '2023_09_18_143741_create_cart_items_table', 11),
(17, '2023_09_18_143819_create_order_information_table', 11),
(18, '2023_09_18_143919_create_orders_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(5, 'App\\Models\\User', 8),
(6, 'App\\Models\\User', 11);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL DEFAULT '1',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('9ee98d07-5cfd-4990-ba04-4dda0ba6dae4', 'Filament\\Notifications\\DatabaseNotification', 'App\\Models\\User', 1, '{\"actions\":[],\"body\":null,\"color\":null,\"duration\":\"persistent\",\"icon\":null,\"iconColor\":null,\"title\":\"cc\",\"view\":\"filament-notifications::notification\",\"viewData\":[],\"format\":\"filament\"}', NULL, '2023-09-05 04:48:42', '2023-09-05 04:49:53');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_information`
--

CREATE TABLE `order_information` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(326, 'view-any Category', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(327, 'view-any Category', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(328, 'view Category', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(329, 'view Category', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(330, 'create Category', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(331, 'create Category', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(332, 'update Category', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(333, 'update Category', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(334, 'delete Category', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(335, 'delete Category', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(336, 'restore Category', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(337, 'restore Category', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(338, 'force-delete Category', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(339, 'force-delete Category', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(340, 'replicate Category', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(341, 'replicate Category', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(342, 'reorder Category', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(343, 'reorder Category', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(344, 'view-any Permission', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(345, 'view-any Permission', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(346, 'view Permission', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(347, 'view Permission', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(348, 'create Permission', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(349, 'create Permission', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(350, 'update Permission', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(351, 'update Permission', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(352, 'delete Permission', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(353, 'delete Permission', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(354, 'restore Permission', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(355, 'restore Permission', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(356, 'force-delete Permission', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(357, 'force-delete Permission', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(358, 'replicate Permission', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(359, 'replicate Permission', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(360, 'reorder Permission', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(361, 'reorder Permission', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(362, 'view-any Product', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(363, 'view-any Product', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(364, 'view Product', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(365, 'view Product', 'api', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(366, 'create Product', 'web', '2023-09-14 08:50:44', '2023-09-14 08:50:44'),
(367, 'create Product', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(368, 'update Product', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(369, 'update Product', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(370, 'delete Product', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(371, 'delete Product', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(372, 'restore Product', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(373, 'restore Product', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(374, 'force-delete Product', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(375, 'force-delete Product', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(376, 'replicate Product', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(377, 'replicate Product', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(378, 'reorder Product', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(379, 'reorder Product', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(380, 'view-any Role', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(381, 'view-any Role', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(382, 'view Role', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(383, 'view Role', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(384, 'create Role', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(385, 'create Role', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(386, 'update Role', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(387, 'update Role', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(388, 'delete Role', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(389, 'delete Role', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(390, 'restore Role', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(391, 'restore Role', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(392, 'force-delete Role', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(393, 'force-delete Role', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(394, 'replicate Role', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(395, 'replicate Role', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(396, 'reorder Role', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(397, 'reorder Role', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(398, 'view-any User', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(399, 'view-any User', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(400, 'view User', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(401, 'view User', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(402, 'create User', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(403, 'create User', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(404, 'update User', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(405, 'update User', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(406, 'delete User', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(407, 'delete User', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(408, 'restore User', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(409, 'restore User', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(410, 'force-delete User', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(411, 'force-delete User', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(412, 'replicate User', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(413, 'replicate User', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(414, 'reorder User', 'web', '2023-09-14 08:50:45', '2023-09-14 08:50:45'),
(415, 'reorder User', 'api', '2023-09-14 08:50:45', '2023-09-14 08:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(138, 'App\\Models\\User', 7, 'khai', '0a5504001ea1a68f6e0e0de8e0d502ce7fda71051aa60f397050f86578e98dd9', '[\"*\"]', NULL, NULL, '2023-09-05 03:43:48', '2023-09-05 03:43:48'),
(139, 'App\\Models\\User', 10, 'khai', '4510217986a9e75fa39a6d5239dff05b1408efc2809996dcc89c42190febc23d', '[\"*\"]', NULL, NULL, '2023-09-05 04:03:37', '2023-09-05 04:03:37'),
(173, 'App\\Models\\User', 11, 'khai', '604d6257bfd89dafce2cc2df5b5586209cc54a4fdd384a1710efa58526665148', '[\"*\"]', '2023-09-18 08:21:26', NULL, '2023-09-18 08:19:52', '2023-09-18 08:21:26'),
(177, 'App\\Models\\User', 12, 'vy chóa', '323d4a0ffb6cc5008f8272d4c7de49319418ceac20ad4b1077d95566ebbfb9b8', '[\"*\"]', '2023-09-19 07:27:18', NULL, '2023-09-19 03:49:53', '2023-09-19 07:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` tinyint NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `description`, `content`, `quantity`, `visibility`, `url`, `created_at`, `updated_at`) VALUES
(29, 17, '1', '12000', 'asd', '123', '4', 1, NULL, '2023-09-17 07:54:50', '2023-09-17 07:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(5, 'Super Admin', 'web', '2023-09-14 08:51:36', '2023-09-14 08:51:36'),
(6, 'Product Manager', 'web', '2023-09-14 08:56:07', '2023-09-14 08:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(326, 5),
(327, 5),
(328, 5),
(329, 5),
(330, 5),
(331, 5),
(332, 5),
(333, 5),
(334, 5),
(335, 5),
(336, 5),
(337, 5),
(338, 5),
(339, 5),
(340, 5),
(341, 5),
(342, 5),
(343, 5),
(344, 5),
(345, 5),
(346, 5),
(347, 5),
(348, 5),
(349, 5),
(350, 5),
(351, 5),
(352, 5),
(353, 5),
(354, 5),
(355, 5),
(356, 5),
(357, 5),
(358, 5),
(359, 5),
(360, 5),
(361, 5),
(362, 5),
(363, 5),
(364, 5),
(365, 5),
(366, 5),
(367, 5),
(368, 5),
(369, 5),
(370, 5),
(371, 5),
(372, 5),
(373, 5),
(374, 5),
(375, 5),
(376, 5),
(377, 5),
(378, 5),
(379, 5),
(380, 5),
(381, 5),
(382, 5),
(383, 5),
(384, 5),
(385, 5),
(386, 5),
(387, 5),
(388, 5),
(389, 5),
(390, 5),
(391, 5),
(392, 5),
(393, 5),
(394, 5),
(395, 5),
(396, 5),
(397, 5),
(398, 5),
(399, 5),
(400, 5),
(401, 5),
(402, 5),
(403, 5),
(404, 5),
(405, 5),
(406, 5),
(407, 5),
(408, 5),
(409, 5),
(410, 5),
(411, 5),
(412, 5),
(413, 5),
(414, 5),
(415, 5),
(326, 6),
(327, 6),
(328, 6),
(329, 6),
(330, 6),
(331, 6),
(332, 6),
(333, 6),
(334, 6),
(335, 6),
(338, 6),
(339, 6),
(362, 6),
(363, 6),
(364, 6),
(365, 6),
(366, 6),
(367, 6),
(370, 6),
(371, 6),
(372, 6),
(374, 6),
(375, 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `code`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'admin', 'nguyendangkhai111@gmail.com', NULL, '$2y$10$bf3F1fmbjVxtHdctgnph2e8K.i8ZpSPfuWWRdL8mzYq.ZhBPZKJTi', NULL, 'U0VX7mULODKG0eyihVGRCKin5rWLlkVC7QH7QWMnBy6r4rf2j5xgd56iJTf2', '2023-08-30 07:16:28', '2023-09-06 03:20:29'),
(11, 'khai', 'khaind148@gmail.com', '2023-09-05 04:11:54', '$2y$10$CZVST4DXjaKNHEVOxX6zY.eI/Cgn5wQtcFhtWQkcOE2vUt1C7qPqm', NULL, NULL, '2023-09-05 04:06:36', '2023-09-06 03:26:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `order_information`
--
ALTER TABLE `order_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_information`
--
ALTER TABLE `order_information`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=416;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
