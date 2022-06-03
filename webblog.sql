-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 02, 2022 lúc 09:47 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webblog`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add blog', 8, 'add_blog'),
(30, 'Can change blog', 8, 'change_blog'),
(31, 'Can delete blog', 8, 'delete_blog'),
(32, 'Can view blog', 8, 'view_blog'),
(33, 'Can add comment', 9, 'add_comment'),
(34, 'Can change comment', 9, 'change_comment'),
(35, 'Can delete comment', 9, 'delete_comment'),
(36, 'Can view comment', 9, 'view_comment'),
(37, 'Can add reply comment', 10, 'add_replycomment'),
(38, 'Can change reply comment', 10, 'change_replycomment'),
(39, 'Can delete reply comment', 10, 'delete_replycomment'),
(40, 'Can view reply comment', 10, 'view_replycomment'),
(41, 'Can add users', 11, 'add_users'),
(42, 'Can change users', 11, 'change_users'),
(43, 'Can delete users', 11, 'delete_users'),
(44, 'Can view users', 11, 'view_users');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$lAqGasL3YASI3cuGnB20c9$ACbo6dyBags8C0qJFEZBtFeNZibV3W29e5HM58R8KSg=', '2022-05-29 17:57:08.749789', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-05-22 02:43:11.129115');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog_blog`
--

CREATE TABLE `blog_blog` (
  `blog_id` int(11) NOT NULL,
  `blog_title` varchar(50) NOT NULL,
  `blog_content` longtext NOT NULL,
  `blog_img` varchar(100) NOT NULL,
  `blog_author` varchar(50) NOT NULL,
  `blog_create_date` datetime(6) NOT NULL,
  `category_id_id` int(11) DEFAULT NULL,
  `blog_slug` varchar(50) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `blog_blog`
--

INSERT INTO `blog_blog` (`blog_id`, `blog_title`, `blog_content`, `blog_img`, `blog_author`, `blog_create_date`, `category_id_id`, `blog_slug`, `user_id_id`) VALUES
(9, 'Đào Phương Uyên', '<p>rất rất xinh gái</p><p>làm người yêu</p>', 'blog/DPU.jpg', 'phuocit', '2022-05-31 14:41:59.188254', 4, 'Dao-Phuong-Uyen-cute-ATG69ivpu', 1),
(17, 'Đào Phương Uyên cute', '<p>rất rất xinh gái</p>', 'blog/DPU.jpg', 'phuocit', '2022-05-31 17:30:52.614603', 4, 'Dao-Phuong-Uyen-cute-s9HGtcOdeU', 1),
(18, 'phước yêu uyên rất nhiều', '<p>anh yêu em nhất trên đời này</p>', 'blog/280392846_1415987868826061_69113241569002644_n.jpg', 'phuocit', '2022-05-31 18:51:11.462398', 3, 'phuoc-yeu-uyen-rat-nhieu-M5zTuBLYjx', 1),
(19, 'lê hữu phước', '<p>ngu như đầu buồi</p>', 'blog/DPU1.jpg', 'phuocit', '2022-05-31 18:54:02.424621', 3, 'pham-tan-duong-EHZZ19CYSl', 1),
(20, 'Lê Hữu Phước IT', '<p>hihihaha</p>', 'blog/DPU1.jpg', 'phuocit0201', '2022-06-01 02:16:58.248158', 4, 'Le-Huu-ysitOIp6TE', 2),
(26, 'Lê Hữu Phước', '<p>huhuhahahaha</p>', 'blog/DPU.jpg', 'lehuuphuoc', '2022-06-01 08:13:43.481186', 4, 'Le-Huu-Phuoc-QhH7o3oRpT', 7),
(27, 'viêng băng nghiên', '<p>quá xinh xắn hehehehe</p>', 'blog/280392846_1415987868826061_69113241569002644_n.jpg', 'admin12', '2022-06-01 18:18:15.577353', 4, 'vieng-bang-nghien-MjAOoOp8YX', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_category`
--

CREATE TABLE `category_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `category_slug` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category_category`
--

INSERT INTO `category_category` (`category_id`, `category_name`, `create_date`, `category_slug`) VALUES
(3, 'Chia sẻ kinh nghiệm học lập trình', '2022-05-29 17:07:24.381099', 'chia-se-kinh-nghiem-hoc-lap-trinh'),
(4, 'Gái xinh', '2022-05-31 17:56:07.410012', 'gai-xinh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment_comment`
--

CREATE TABLE `comment_comment` (
  `Comment_id` int(11) NOT NULL,
  `Comment_content` longtext NOT NULL,
  `Comment_date` datetime(6) DEFAULT NULL,
  `Comment_blog_id_id` int(11) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment_comment`
--

INSERT INTO `comment_comment` (`Comment_id`, `Comment_content`, `Comment_date`, `Comment_blog_id_id`, `user_id_id`) VALUES
(39, 'hihihihahah', '2022-05-22 12:46:23.000000', 26, 1),
(40, 'xinh dữ ta ', '2022-06-02 01:04:21.488451', 26, 1),
(41, 'uyên xinh vãi luôn', '2022-06-02 01:06:29.579845', 26, 8),
(42, 'xinh như này ai chịu nỗi trời\n', '2022-06-02 01:07:04.786486', 26, 8),
(43, 'phuoc hihi', '2022-06-02 01:18:46.353876', 27, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-05-22 02:45:00.797589', '1', '1,Phước Cu Siêu To,2022-05-22 02:44:53+00:00', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-05-22 03:46:32.523335', '1', '1', 1, '[{\"added\": {}}]', 8, 1),
(3, '2022-05-22 03:48:20.435596', '1', '1', 2, '[{\"changed\": {\"fields\": [\"Blog img\"]}}]', 8, 1),
(4, '2022-05-22 03:49:38.873675', '2', '2', 1, '[{\"added\": {}}]', 8, 1),
(5, '2022-05-22 05:48:18.022972', '1', '1', 1, '[{\"added\": {}}]', 9, 1),
(6, '2022-05-22 06:27:29.139764', '1', '1', 2, '[{\"changed\": {\"fields\": [\"Blog img\"]}}]', 8, 1),
(7, '2022-05-22 06:29:03.915012', '2', '2', 2, '[{\"changed\": {\"fields\": [\"Blog img\"]}}]', 8, 1),
(8, '2022-05-22 06:40:53.341560', '1', '1', 2, '[{\"changed\": {\"fields\": [\"Blog img\"]}}]', 8, 1),
(9, '2022-05-22 07:42:20.387247', '1', '1', 2, '[{\"changed\": {\"fields\": [\"Blog content\"]}}]', 8, 1),
(10, '2022-05-22 08:35:54.507805', '1', '1', 2, '[{\"changed\": {\"fields\": [\"Comment content\"]}}]', 9, 1),
(11, '2022-05-22 08:36:25.803846', '2', '2', 1, '[{\"added\": {}}]', 9, 1),
(12, '2022-05-22 08:52:40.296836', '1', '1', 1, '[{\"added\": {}}]', 10, 1),
(13, '2022-05-22 09:15:15.052604', '1', '1', 2, '[{\"changed\": {\"fields\": [\"Comment content\"]}}]', 9, 1),
(14, '2022-05-22 09:50:58.315268', '2', '2', 1, '[{\"added\": {}}]', 10, 1),
(15, '2022-05-22 10:39:30.594666', '3', '3', 1, '[{\"added\": {}}]', 9, 1),
(16, '2022-05-22 10:54:26.542034', '3', 'rep cmt 2', 1, '[{\"added\": {}}]', 10, 1),
(17, '2022-05-23 02:37:46.828443', '4', 'tao rep cmt mày nè phước', 1, '[{\"added\": {}}]', 10, 1),
(18, '2022-05-23 02:38:32.815075', '4', '4', 2, '[{\"changed\": {\"fields\": [\"Comment content\"]}}]', 9, 1),
(19, '2022-05-23 02:54:13.270877', '1', '1', 2, '[{\"changed\": {\"fields\": [\"Comment content\"]}}]', 9, 1),
(20, '2022-05-23 02:55:47.403929', '2', '2', 2, '[{\"changed\": {\"fields\": [\"Comment content\"]}}]', 9, 1),
(21, '2022-05-23 02:57:01.740835', '4', '4', 2, '[{\"changed\": {\"fields\": [\"Comment content\"]}}]', 9, 1),
(22, '2022-05-23 02:57:41.097529', '6', '6', 1, '[{\"added\": {}}]', 9, 1),
(23, '2022-05-23 02:58:07.105744', '5', 'rep cmt của bài viết 2', 1, '[{\"added\": {}}]', 10, 1),
(24, '2022-05-23 07:09:56.062601', '3', '3', 1, '[{\"added\": {}}]', 8, 1),
(25, '2022-05-25 14:14:15.702861', '3', '3', 2, '[{\"changed\": {\"fields\": [\"Blog content\"]}}]', 8, 1),
(26, '2022-05-25 14:16:27.568465', '3', '3', 2, '[{\"changed\": {\"fields\": [\"Blog title\", \"Blog content\"]}}]', 8, 1),
(27, '2022-05-25 14:17:22.064059', '3', '3', 2, '[{\"changed\": {\"fields\": [\"Blog title\"]}}]', 8, 1),
(28, '2022-05-26 02:43:17.777387', '3', '3', 2, '[{\"changed\": {\"fields\": [\"Blog content\"]}}]', 8, 1),
(29, '2022-05-26 03:15:11.926650', '3', '3', 2, '[{\"changed\": {\"fields\": [\"Blog content\"]}}]', 8, 1),
(30, '2022-05-26 03:15:58.580192', '3', '3', 2, '[{\"changed\": {\"fields\": [\"Blog content\"]}}]', 8, 1),
(31, '2022-05-26 03:21:31.874056', '3', '3', 2, '[{\"changed\": {\"fields\": [\"Blog content\", \"Blog slug\"]}}]', 8, 1),
(32, '2022-05-26 03:32:01.436700', '1', '1', 2, '[{\"changed\": {\"fields\": [\"Blog content\", \"Blog slug\"]}}]', 8, 1),
(33, '2022-05-26 04:11:19.636004', '1', 'Phước Cu Siêu To', 2, '[{\"changed\": {\"fields\": [\"Category slug\"]}}]', 7, 1),
(34, '2022-05-26 08:49:18.998659', '2', '2', 2, '[{\"changed\": {\"fields\": [\"Blog title\", \"Blog content\", \"Blog slug\"]}}]', 8, 1),
(35, '2022-05-26 08:49:29.606493', '1', '1', 2, '[{\"changed\": {\"fields\": [\"Blog title\"]}}]', 8, 1),
(36, '2022-05-26 17:00:08.694792', '2', 'Băng Nghiên', 1, '[{\"added\": {}}]', 7, 1),
(37, '2022-05-26 17:01:50.066117', '4', '4', 1, '[{\"added\": {}}]', 8, 1),
(38, '2022-05-27 11:51:32.224083', '7', '7', 1, '[{\"added\": {}}]', 9, 1),
(39, '2022-05-29 17:04:34.879391', '2', 'Băng Nghiên', 3, '', 7, 1),
(40, '2022-05-29 17:04:38.741637', '1', 'Phước Cu Siêu To', 3, '', 7, 1),
(41, '2022-05-29 17:07:24.383129', '3', 'Chia sẻ kinh nghiệm học lập trình', 1, '[{\"added\": {}}]', 7, 1),
(42, '2022-05-29 17:12:59.124302', '5', '5', 1, '[{\"added\": {}}]', 8, 1),
(43, '2022-05-29 17:58:30.562933', '6', '6', 1, '[{\"added\": {}}]', 8, 1),
(44, '2022-05-29 18:00:51.303930', '7', '7', 1, '[{\"added\": {}}]', 8, 1),
(45, '2022-05-29 18:02:32.910677', '7', '7', 2, '[{\"changed\": {\"fields\": [\"User id\"]}}]', 8, 1),
(46, '2022-05-31 08:02:21.047310', '8', '8', 1, '[{\"added\": {}}]', 8, 1),
(47, '2022-05-31 17:56:07.412597', '4', 'Gái xinh', 1, '[{\"added\": {}}]', 7, 1),
(48, '2022-06-01 08:48:36.413373', '39', '39', 1, '[{\"added\": {}}]', 9, 1),
(49, '2022-06-01 08:53:47.156754', '6', 'gà vl', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'Blog', 'blog'),
(7, 'Category', 'category'),
(9, 'Comment', 'comment'),
(5, 'contenttypes', 'contenttype'),
(10, 'ReplyComment', 'replycomment'),
(6, 'sessions', 'session'),
(11, 'User', 'users');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Category', '0001_initial', '2022-05-22 02:41:09.064780'),
(2, 'contenttypes', '0001_initial', '2022-05-22 02:41:09.118796'),
(3, 'auth', '0001_initial', '2022-05-22 02:41:09.584043'),
(4, 'admin', '0001_initial', '2022-05-22 02:41:09.719868'),
(5, 'admin', '0002_logentry_remove_auto_add', '2022-05-22 02:41:09.797231'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-22 02:41:09.951676'),
(7, 'contenttypes', '0002_remove_content_type_name', '2022-05-22 02:41:10.114042'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-05-22 02:41:10.176182'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-05-22 02:41:10.209316'),
(10, 'auth', '0004_alter_user_username_opts', '2022-05-22 02:41:10.234017'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-05-22 02:41:10.282984'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-05-22 02:41:10.288626'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-05-22 02:41:10.314133'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-05-22 02:41:10.343993'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-05-22 02:41:10.373767'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-05-22 02:41:10.406717'),
(17, 'auth', '0011_update_proxy_permissions', '2022-05-22 02:41:10.431703'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-05-22 02:41:10.461630'),
(19, 'sessions', '0001_initial', '2022-05-22 02:41:10.509103'),
(20, 'Blog', '0001_initial', '2022-05-22 02:49:22.110614'),
(21, 'Blog', '0002_blog_category_id', '2022-05-22 03:18:45.022684'),
(22, 'Comment', '0001_initial', '2022-05-22 03:36:20.202178'),
(23, 'Blog', '0003_alter_blog_blog_img', '2022-05-22 03:44:52.376680'),
(24, 'ReplyComment', '0001_initial', '2022-05-22 05:55:09.586160'),
(25, 'Blog', '0004_alter_blog_blog_content', '2022-05-26 02:42:06.360839'),
(26, 'Blog', '0005_blog_blog_slug', '2022-05-26 03:18:07.434852'),
(27, 'Blog', '0006_alter_blog_blog_slug', '2022-05-26 03:18:54.422603'),
(28, 'Category', '0002_category_category_slug', '2022-05-26 04:10:44.792125'),
(29, 'Comment', '0002_alter_comment_comment_date', '2022-05-27 11:50:22.974380'),
(30, 'Comment', '0003_alter_comment_comment_date', '2022-05-27 17:42:55.843239'),
(31, 'User', '0001_initial', '2022-05-29 05:43:49.587518'),
(32, 'User', '0002_users_user_img', '2022-05-29 08:13:17.701448'),
(33, 'Blog', '0007_blog_user_id', '2022-05-29 08:18:55.725490'),
(34, 'User', '0003_users_user_date', '2022-05-29 10:19:42.810264'),
(35, 'Category', '0003_alter_category_create_date', '2022-05-29 17:06:06.241604'),
(36, 'Blog', '0008_alter_blog_blog_create_date', '2022-05-29 17:11:24.284176'),
(37, 'User', '0004_users_user_address_users_user_email_users_user_phone', '2022-06-01 03:23:16.549456'),
(38, 'Comment', '0004_comment_user_id', '2022-06-01 17:34:43.472426');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2w41jw2s5q4fmd80tihrcbm5r9bak4kq', '.eJxVjEEOwiAQRe_C2hAY2lK7dO8ZyMAMFjXUlDbRGO8uTbrQ7Xv_v7dwuC6jWwvPLpEYhBaHX-Yx3Dhvgq6YL5MMU17m5OU2kbst8jwR30_79i8wYhnr2zAaJvTKNi21gaw-mqY30UZAgz23mhR00PVgIUbU4FkFDeBDpAZDV6OJtqAYdO0XLiVN2fHzkeZXZerzBaLsQx0:1nwabI:EdQFO4dZaBusGayhrGaYx1eb5FvJ2IfZRzD3GFYu4GE', '2022-06-02 02:30:26.257080'),
('303i94ye0vh700soi98ejfbps4ps0w4y', 'eyJfc2Vzc2lvbl9leHBpcnkiOjg2NDAwLCJpZHVzZXIiOjE0fQ:1nwqeF:fEQw-4C4mKZ5kxohOKZyQlRdGNhhW144-LaK0soQtbU', '2022-06-03 19:38:23.378006'),
('aox163qv891uv82uo0voo927qkio54wg', 'eyJhdXRoIjozNDgyNjQsIl9zZXNzaW9uX2V4cGlyeSI6MTgwfQ:1nwdUS:lLiJIBC6FfHOTaes83BKLYFE-1IuZuCoc3l4a-dqub0', '2022-06-02 05:38:24.713548'),
('cx5h4ib04rsrtkb0n1nrisoj6fi70jik', 'eyJmb3Jnb3RwYXNzIjo3NTE4OTcsIl9zZXNzaW9uX2V4cGlyeSI6MTB9:1nwpkq:8SeAuhvSc0pL3WxBKfht9oODsiY2kg3IXw9oV7lsJ7M', '2022-06-02 18:41:18.617381'),
('dq02ies7vopnspulwabyaebd5ack7u3h', 'eyJmb3Jnb3RwYXNzIjo0Nzc1NzksIl9zZXNzaW9uX2V4cGlyeSI6MzAwfQ:1nwqJo:EWWCnpra1XL0YFkGNb81k9R5JIxLKb190VE3n7qPm7Q', '2022-06-02 19:22:16.535362'),
('iqib77drresa8hk0rgt4imj7pglotcs4', 'eyJhdXRoIjoxNzU2MzksIl9zZXNzaW9uX2V4cGlyeSI6MTgwfQ:1nwbIw:Xt1E4HMmg6H8Nd9XHgydQuAExdjBnTFvXOirjC4pNdU', '2022-06-02 03:18:22.582044'),
('jdand9kawlbbd3o4sdae784b1mkzulow', 'eyJhdXRoIjoyNTcyNjIsIl9zZXNzaW9uX2V4cGlyeSI6MTgwfQ:1nwdM9:cGthiNUQrR7VtjQoL0nemf0GrfVBt5Fq4sRn0lIh7Ys', '2022-06-02 05:29:49.815829'),
('jmz5o5o45dzart1ntvhvlpy8iw9wmpkt', 'eyJmb3Jnb3RwYXNzIjo5NTQ3OTksIl9zZXNzaW9uX2V4cGlyeSI6MzAwfQ:1nwptu:xU2Yiy17WIQ85tAzjmIglFBl28yhrOtH3hC1pMxoGUA', '2022-06-02 18:55:30.188636'),
('rs94iff8vt3bvrsh9mezljcipb8jwp9g', 'eyJhdXRoIjo4MzM2NjcsIl9zZXNzaW9uX2V4cGlyeSI6MTgwfQ:1nwazg:5AuDVDDWMyUFCMvxyyGZThpOA-5qc2pUNvIqs93jg0E', '2022-06-02 02:58:28.468523'),
('sg84uxph9150qaaioxihxdge15aeig63', 'eyJfc2Vzc2lvbl9leHBpcnkiOjMwMCwiZm9yZ290cGFzcyI6NTgwNDk4fQ:1nwpRM:RW_d0JUKVqaqIZC0xo-BtIAz_RQMqPOA9EZs66GepqQ', '2022-06-02 18:26:00.634045'),
('sqr3v88l674qfc2xny2ug3e996ioccnx', 'eyJmb3Jnb3RwYXNzIjo0MTE0MjYsIl9zZXNzaW9uX2V4cGlyeSI6MzAwfQ:1nwqXh:szuN5ZYFlAa3rGzpYGSsAcvtaLnhT8ze7EG2tgmbbo0', '2022-06-02 19:36:37.263120'),
('tip015dd793a232p935j9fg8l5vdscpr', 'eyJhdXRoIjo3Mzg3NTgsIl9zZXNzaW9uX2V4cGlyeSI6MTgwfQ:1nwdcT:QAIjxJXlfUkVom0nMUhD9PD9yRSH-Ueo6xOn5Axgbno', '2022-06-02 05:46:41.254483'),
('w3fupbhfwxyqpn2zzegqkp8eijwtofye', 'eyJhdXRoIjoyMzIxNjQsIl9zZXNzaW9uX2V4cGlyeSI6MTgwfQ:1nwb5J:5K4yQri_SwDDeTeZ4cCJbQIUEk9Qsn3h_du5TNx1CPY', '2022-06-02 03:04:17.779868'),
('ygiajqjm19bsm0eel9asr0fnz6htttnx', 'eyJmb3Jnb3RwYXNzIjo4ODMxMzUsIl9zZXNzaW9uX2V4cGlyeSI6MTB9:1nwpeg:uDnGwEFk6eFCSUagPruMTb5SugDrnb9ZsJSNKDtuZ_U', '2022-06-02 18:34:56.807242');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `replycomment_replycomment`
--

CREATE TABLE `replycomment_replycomment` (
  `ReplyComment_id` int(11) NOT NULL,
  `ReplyComment_content` longtext NOT NULL,
  `ReplyComment_date` datetime(6) NOT NULL,
  `Comment_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `replycomment_replycomment`
--

INSERT INTO `replycomment_replycomment` (`ReplyComment_id`, `ReplyComment_content`, `ReplyComment_date`, `Comment_id_id`) VALUES
(6, 'gà vl', '2022-05-22 03:52:32.000000', 39);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_users`
--

CREATE TABLE `user_users` (
  `User_id` int(11) NOT NULL,
  `User_username` varchar(50) NOT NULL,
  `User_password` varchar(100) NOT NULL,
  `User_name` varchar(50) NOT NULL,
  `User_img` longtext DEFAULT NULL,
  `User_date` datetime(6) DEFAULT NULL,
  `User_address` varchar(100) DEFAULT NULL,
  `User_email` varchar(100) DEFAULT NULL,
  `User_phone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_users`
--

INSERT INTO `user_users` (`User_id`, `User_username`, `User_password`, `User_name`, `User_img`, `User_date`, `User_address`, `User_email`, `User_phone`) VALUES
(1, 'phuocit', '111111', 'Lê Hữu Phước IT', 'blog/ASP.NET.png', '2022-05-29 17:51:13.163140', 'quảng ngãii', 'phuoc@gmail.comm', '08451511174'),
(2, 'phuocit0201', '1', '1', 'blog/user.png', '2022-05-29 17:57:59.349601', NULL, NULL, NULL),
(3, 'admin', '1', 'Lê Hữu Phước', 'blog/user.png', '2022-05-29 18:09:37.853450', NULL, NULL, NULL),
(4, 'admin1', '1', 'PHUOC ', 'blog/user.png', '2022-05-29 18:12:57.992845', NULL, NULL, NULL),
(5, 'phuocit02012001', 'phuocit0201', 'Lê Hữu Phước', 'blog/user.png', '2022-06-01 12:23:23.777246', 'a', 'phuoc@gmail.com', '0845151117'),
(6, 'phuocit02012', '123456', 'Lê Hữu Phước', 'blog/user.png', '2022-06-01 12:25:08.451581', 'sơnha', 'lehuuphuocit0201@gmail.com', '0845151117'),
(7, 'lehuuphuoc', '123456', 'Phương Uyên Đào', 'blog/DPU1.jpg', '2022-06-01 14:20:01.427613', 'sơnha', 'phuonguyen@gmail.com', '08451511178'),
(8, 'admin12', '123456', 'Lê Hữu Hack', 'blog/DPU1.jpg', '2022-06-02 01:05:32.529923', 'sơnha', 'phuoc@gmail.com', '0212121111'),
(9, 'phuoc', '123456', 'Lê Hữu Phước', 'blog/user.png', '2022-06-02 10:28:18.635967', 'sơnha', 'phuoc1@gmail.com', '0212121111'),
(12, 'khactai', '123456', 'Nguyễn Khắc Tài', 'blog/user.png', '2022-06-02 14:31:10.957303', 'sơnha', 'kaskobi2001@gmail.com', '0212121111'),
(14, 'phuocdeptrai', '111111', 'Lê Hữu Phước', 'blog/user.png', '2022-06-03 00:58:45.741459', 'sơnha', 'huuphuocit0201@gmail.com', '0845151117');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `blog_blog`
--
ALTER TABLE `blog_blog`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `Blog_blog_category_id_id_c9b3b12f_fk_Category_` (`category_id_id`),
  ADD KEY `Blog_blog_user_id_id_f4971b36_fk_User_users_User_id` (`user_id_id`);

--
-- Chỉ mục cho bảng `category_category`
--
ALTER TABLE `category_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comment_comment`
--
ALTER TABLE `comment_comment`
  ADD PRIMARY KEY (`Comment_id`),
  ADD KEY `Comment_comment_Comment_blog_id_id_61e5ab0d_fk_Blog_blog_blog_id` (`Comment_blog_id_id`),
  ADD KEY `Comment_comment_user_id_id_33ab3fe4_fk_User_users_User_id` (`user_id_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `replycomment_replycomment`
--
ALTER TABLE `replycomment_replycomment`
  ADD PRIMARY KEY (`ReplyComment_id`),
  ADD KEY `ReplyComment_replyco_Comment_id_id_1a0f0e4f_fk_Comment_c` (`Comment_id_id`);

--
-- Chỉ mục cho bảng `user_users`
--
ALTER TABLE `user_users`
  ADD PRIMARY KEY (`User_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blog_blog`
--
ALTER TABLE `blog_blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `category_category`
--
ALTER TABLE `category_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `comment_comment`
--
ALTER TABLE `comment_comment`
  MODIFY `Comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `replycomment_replycomment`
--
ALTER TABLE `replycomment_replycomment`
  MODIFY `ReplyComment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user_users`
--
ALTER TABLE `user_users`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `blog_blog`
--
ALTER TABLE `blog_blog`
  ADD CONSTRAINT `Blog_blog_category_id_id_c9b3b12f_fk_Category_` FOREIGN KEY (`category_id_id`) REFERENCES `category_category` (`category_id`),
  ADD CONSTRAINT `Blog_blog_user_id_id_f4971b36_fk_User_users_User_id` FOREIGN KEY (`user_id_id`) REFERENCES `user_users` (`User_id`);

--
-- Các ràng buộc cho bảng `comment_comment`
--
ALTER TABLE `comment_comment`
  ADD CONSTRAINT `Comment_comment_Comment_blog_id_id_61e5ab0d_fk_Blog_blog_blog_id` FOREIGN KEY (`Comment_blog_id_id`) REFERENCES `blog_blog` (`blog_id`),
  ADD CONSTRAINT `Comment_comment_user_id_id_33ab3fe4_fk_User_users_User_id` FOREIGN KEY (`user_id_id`) REFERENCES `user_users` (`User_id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `replycomment_replycomment`
--
ALTER TABLE `replycomment_replycomment`
  ADD CONSTRAINT `ReplyComment_replyco_Comment_id_id_1a0f0e4f_fk_Comment_c` FOREIGN KEY (`Comment_id_id`) REFERENCES `comment_comment` (`Comment_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
