<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Star Wars Catalog</title>
    
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    
    <!-- Meta tags -->
    <meta name="description" content="Catálogo de filmes Star Wars">
    <meta name="keywords" content="star wars, filmes, catálogo">
</head>
<body class="d-flex flex-column min-vh-100">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <?php
            $basePath = rtrim(dirname($_SERVER['SCRIPT_NAME']), '/');
            ?>
            <a class="navbar-brand" href="<?php echo $basePath ? $basePath : '/'; ?>">Star Wars Catalog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo $basePath ? $basePath . '/films' : '/films'; ?>">Filmes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo $basePath ? $basePath . '/stats' : '/stats'; ?>">Estatísticas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo $basePath ? $basePath . "/test/cache" : "/test/cache"; ?>">Teste</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Conteúdo principal -->
    <main class="container my-4 flex-grow-1">
        <?php if (isset($content)) echo $content; ?>
    </main>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-auto">
        <div class="container text-center">
            <p class="mb-0">&copy; <?php echo date('Y'); ?> Star Wars Catalog. Todos os direitos reservados.</p>
        </div>
    </footer>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/main.js"></script>

    <!-- Debug Info (remova em produção) -->
    <script>
    console.log('Base Path:', '<?php echo $basePath; ?>');
    console.log('Full URL:', window.location.href);
    </script>
</body>
</html> 
