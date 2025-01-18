<div class="row">
    <div class="col-12">
        <h1 class="mb-4">Filmes Star Wars</h1>
    </div>
</div>

<div class="row row-cols-1 row-cols-md-3 g-4">
    <?php foreach ($films as $film): ?>
        <?php $isFavorite = (new App\Controllers\FavoriteController())->isFavorite($film['episode_id']); ?>
        <div class="col">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="card-title"><?php echo htmlspecialchars($film['title']); ?></h5>
                    <p class="card-text">
                        <small class="text-muted">
                            Lançamento: <?php echo date('d/m/Y', strtotime($film['release_date'])); ?>
                        </small>
                    </p>
                    <button class="btn <?php echo $isFavorite ? 'btn-danger' : 'btn-outline-danger'; ?> btn-sm favorite-btn" 
                            data-film-id="<?php echo $film['episode_id']; ?>"
                            data-film-title="<?php echo htmlspecialchars($film['title']); ?>">
                        <i class="fas fa-heart"></i> 
                        <span class="favorite-text"><?php echo $isFavorite ? 'Desfavoritar' : 'Favoritar'; ?></span>
                    </button>
                    <a href="/films/<?php echo $film['episode_id']; ?>" class="btn btn-primary">Ver detalhes</a>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</div>

<!-- Toast para notificações -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <strong class="me-auto">Notificação</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body"></div>
    </div>
</div>
