<div class="row">
    <div class="col-12">
        <a href="/films" class="btn btn-secondary mb-4">← Voltar para lista</a>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title"><?php echo htmlspecialchars($film['title']); ?></h1>
                <h3 class="text-muted">Episódio <?php echo $film['episode_id']; ?></h3>
                
                <div class="mt-4">
                    <h4>Sinopse</h4>
                    <p><?php echo nl2br(htmlspecialchars($film['opening_crawl'])); ?></p>
                </div>

                <div class="row mt-4">
                    <div class="col-md-6">
                        <h4>Informações</h4>
                        <ul class="list-unstyled">
                            <li><strong>Data de Lançamento:</strong> <?php echo date('d/m/Y', strtotime($film['release_date'])); ?></li>
                            <li><strong>Diretor:</strong> <?php echo htmlspecialchars($film['director']); ?></li>
                            <li><strong>Produtor(es):</strong> <?php echo htmlspecialchars($film['producer']); ?></li>
                        </ul>
                    </div>
                    
                    <div class="col-md-6">
                        <h4>Idade do Filme</h4>
                        <p>
                            <?php echo $age['years']; ?> anos, 
                            <?php echo $age['months']; ?> meses e 
                            <?php echo $age['days']; ?> dias
                        </p>
                    </div>
                </div>

                <div class="mt-4">
                    <h4>Personagens</h4>
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <?php foreach ($characters as $character): ?>
                            <div class="col">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title"><?php echo htmlspecialchars($character['name']); ?></h5>
                                        <ul class="list-unstyled">
                                            <li><small>Altura: <?php echo $character['height']; ?> cm</small></li>
                                            <li><small>Peso: <?php echo $character['mass']; ?> kg</small></li>
                                            <li><small>Gênero: <?php echo $character['gender']; ?></small></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 
