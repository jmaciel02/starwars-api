<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estatísticas - Star Wars</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-4">
        <h1 class="mb-4">Estatísticas Gerais</h1>
        
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total de Requisições</h5>
                        <p class="card-text display-4"><?php echo number_format($stats['total_requests']); ?></p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Tempo Médio de Resposta</h5>
                        <p class="card-text display-4"><?php echo number_format($stats['avg_response_time'], 2); ?>ms</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Total de Erros</h5>
                        <p class="card-text display-4"><?php echo number_format($stats['total_errors']); ?></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Performance do Cache</h5>
                        <div class="row">
                            <div class="col-6">
                                <p>Hits: <?php echo number_format($stats['cache_hits']); ?></p>
                            </div>
                            <div class="col-6">
                                <p>Misses: <?php echo number_format($stats['cache_misses']); ?></p>
                            </div>
                        </div>
                        <a href="/stats/cache" class="btn btn-primary">Ver Detalhes</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Log de Erros</h5>
                        <p>Total de erros registrados: <?php echo number_format($stats['total_errors']); ?></p>
                        <a href="/stats/errors" class="btn btn-danger">Ver Log</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Top Endpoints -->
<div class="row mt-4">
    <div class="col-md-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Endpoints Mais Acessados</h5>
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th>Endpoint</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($stats['api_logs_stats']['top_endpoints'] as $endpoint): ?>
                            
                        <tr>
                            <td><?= htmlspecialchars($endpoint['endpoint']) ?></td>
                            <td><?= number_format($endpoint['count']) ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Erros Recentes</h5>
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th>Endpoint</th>
                            <th>Código</th>
                            <th>Data</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($stats['api_logs_stats']['recent_errors'] as $error): ?>
                        <tr>
                            <td><?= htmlspecialchars($error['endpoint']) ?></td>
                            <td><?= $error['response_code'] ?></td>
                            <td><?= (new DateTime($error['created_at']))->format('d/m/Y H:i') ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
      <div class="mt-4">
            <a href="/" class="btn btn-secondary">Voltar para Filmes</a>
        </div>
</div>
      
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
