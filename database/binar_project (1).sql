-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jul 2022 pada 15.22
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `binar_project`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Hobi', '2022-07-02 02:35:09', '2022-07-02 02:35:09'),
(2, 'Kendaraan', '2022-07-02 02:36:10', '2022-07-02 02:38:23'),
(5, 'Alat Masak', '2022-07-07 03:49:08', '2022-07-07 03:50:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `userId`, `categoryId`, `name`, `price`, `description`, `image`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 'raket', '70000', 'kualiatas terbaik', 'raket.jpg', '2022-07-02 14:56:33', '2022-07-02 14:56:33'),
(2, 1, 1, 'bola', '10000', 'bahan sangat berkualitas dan terjamin', 'bola.jpg', '2022-07-02 14:59:35', '2022-07-02 15:03:28'),
(4, 1, 5, 'Wajan', '100000', 'Bahan yang sangat berkualitas', 'wajan.jpg', '2022-07-07 03:53:14', '2022-07-07 03:53:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20220628094139-create-user.js'),
('20220628143730-create-category.js'),
('20220630063855-create-product.js'),
('20220630065814-create-wishlist.js'),
('20220630090435-create-transaction.js');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `bidprice` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `productId`, `userId`, `bidprice`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 5, '50000', 'pending', '2022-07-06 17:23:45', '2022-07-06 17:23:45'),
(2, 2, 5, '10000', 'pending', '2022-07-07 01:18:50', '2022-07-07 01:18:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `password`, `city`, `address`, `phone`, `image`, `createdAt`, `updatedAt`) VALUES
(1, 'SELLER', 'cendikia fitri nuril', 'cendikia1612@gmail.com', '$2b$10$uRbqoqA.8JQHxwyztpscv.Ku6gGQRKxyDWcs5vHhSVwwFGZbkt3Bm', 'Bandung', 'jl.merdeka', '081215842130', NULL, '2022-06-28 12:58:59', '2022-07-01 13:44:08'),
(2, 'BUYYER', 'Halizah', 'Halizah1612@gmail.com', '$2b$10$gltLKNEUbnDBEmrEWow5T.rrSsuVAA9gklQu.3oSciUHbvYyzjIJa', 'Malang', 'jl.sentani', '081215842130', 'gantungan.jpg', '2022-06-28 14:17:05', '2022-06-28 14:17:05'),
(3, 'BUYYER', 'Halizah', 'Halizah1612@gmail.com', '$2b$10$STYxwxop2dzLAXL3haEAWO33VxoNFBiH6G975khwQ5STX3S5miTv2', 'Malang', 'jl.sentani', '081215842130', 'gantungan.jpg', '2022-06-28 14:19:50', '2022-06-28 14:19:50'),
(4, 'BUYER', 'Haliz', 'Halizah16@gmail.com', '$2b$10$hjsJ37JSM5dTihiy4E8on.I1Izrdtx3SG8riFXWbNoiiEoD8QEae6', 'Malang', 'jl.danau', '081215842130', 'gantungan.jpg', '2022-07-03 14:11:29', '2022-07-03 14:11:29'),
(5, 'BUYER', 'pembeli', 'pembeli@gmail.com', '$2b$10$BQpxlIbrN.OYMG4DpXvcGOjjqa0GEAbQWKhea6/SrAqvBlFohQi5u', 'surabaya', 'jl.melati', '0833565212120', 'gantungan.jpg', '2022-07-04 07:39:40', '2022-07-04 07:39:40'),
(6, 'BUYER', 'pembeli2', 'pembeli2@gmail.com', '$2b$10$Hs3gJtxUhCCXzXUb1ruCeurh0uC2KAhWbq.xUN7rRtcM/OHOzXqju', 'makassar', 'jl.bunga', '08212133120', 'gantungan.jpg', '2022-07-07 03:36:49', '2022-07-07 03:36:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `wishlists`
--

INSERT INTO `wishlists` (`id`, `productId`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 2, 5, '2022-07-06 16:53:22', '2022-07-06 16:53:22'),
(2, 2, 5, '2022-07-06 17:16:20', '2022-07-06 17:16:20');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indeks untuk tabel `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `userId` (`userId`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
