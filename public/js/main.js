$(document).ready(function() {
    // Função para mostrar toast
    function showToast(message, type = 'success') {
        const toast = $('#liveToast');
        toast.find('.toast-body').text(message);
        toast.find('.toast-header').toggleClass('bg-success text-white', type === 'success')
                                 .toggleClass('bg-danger text-white', type === 'error');
        const bsToast = new bootstrap.Toast(toast);
        bsToast.show();
    }

    // Manipular favoritos
    $('.favorite-btn').click(function(e) {
        e.preventDefault();
        const btn = $(this);
        const filmId = btn.data('film-id');
        const filmTitle = btn.data('film-title');
        
        // Salvar o HTML original do botão
        const originalHtml = btn.html();
        
        // Adicionar estado de loading
        btn.prop('disabled', true)
           .html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>');

        // Fazer requisição para a API
        $.ajax({
            url: '/api/favorites/toggle',
            method: 'POST',
            data: {
                film_id: filmId,
                film_title: filmTitle
            },
            success: function(response) {
                if (response.success) {
                    // Atualizar visual do botão
                    if (response.is_favorite) {
                        btn.removeClass('btn-outline-danger').addClass('btn-danger');
                        btn.html('<i class="fas fa-heart"></i> <span class="favorite-text">Desfavoritar</span>');
                    } else {
                        btn.removeClass('btn-danger').addClass('btn-outline-danger');
                        btn.html('<i class="fas fa-heart"></i> <span class="favorite-text">Favoritar</span>');
                    }
                    showToast(response.message);
                } else {
                    btn.html(originalHtml);
                    showToast(response.message, 'error');
                }
            },
            error: function(xhr) {
                let message = 'Erro ao processar sua solicitação';
                try {
                    const response = JSON.parse(xhr.responseText);
                    message = response.message || message;
                } catch (e) {}
                btn.html(originalHtml);
                showToast(message, 'error');
            },
            complete: function() {
                // Remover estado de loading
                btn.prop('disabled', false);
            }
        });
    });

    // Animação suave ao scroll
    $('a[href^="#"]').on('click', function(e) {
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $($(this).attr('href')).offset().top - 70
        }, 500);
    });

    // Tooltip Bootstrap
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Lazy loading para cards
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('show');
            }
        });
    });

    document.querySelectorAll('.card').forEach((card) => {
        observer.observe(card);
    });
}); 
