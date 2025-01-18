<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log de Erros - Star Wars</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-4">
        <h1 class="mb-4">Log de Erros</h1>
        
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Data/Hora</th>
                                <th>Tipo</th>
                                <th>Mensagem</th>
                                <th>Detalhes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($errors as $error): ?>
                            <tr>
                                <td><?php echo date('d/m/Y H:i:s', strtotime($error['created_at'])); ?></td>
                                <td><?php echo htmlspecialchars($error['type']); ?></td>
                                <td><?php echo htmlspecialchars($error['message']); ?></td>
                                <td>
                                    <?php if (!empty($error['details'])): ?>
                                        <button type="button" class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#errorModal<?php echo $error['id']; ?>">
                                            Ver Detalhes
                                        </button>
                                        
                                        <!-- Modal -->
                                        <div class="modal fade" id="errorModal<?php echo $error['id']; ?>" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Detalhes do Erro</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <pre class="bg-light p-3"><?php echo htmlspecialchars(json_encode(json_decode($error['details']), JSON_PRETTY_PRINT)); ?></pre>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="mt-4">
            <a href="/stats" class="btn btn-secondary">Voltar para Estatísticas</a>
            <a href="/" class="btn btn-primary">Voltar para Filmes</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
