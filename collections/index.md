---
title: Colecciones
layout: default
---
<style>
  .collections-landing {
    display: flex;
    flex-direction: column;
    gap: clamp(44px, 6vw, 72px);
  }

  .collections-hero {
    position: relative;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: clamp(28px, 5vw, 48px);
    padding: clamp(28px, 5vw, 48px);
    border-radius: 32px;
    background: radial-gradient(circle at top left, rgba(255, 255, 255, 0.92), rgba(239, 220, 180, 0.36)),
      linear-gradient(135deg, rgba(112, 77, 15, 0.92), rgba(181, 138, 54, 0.45));
    color: #fdf9f0;
    overflow: hidden;
    box-shadow: 0 28px 60px -36px rgba(51, 35, 4, 0.65);
  }

  .collections-hero::after {
    content: "";
    position: absolute;
    inset: 0;
    background: radial-gradient(circle at bottom right, rgba(253, 249, 240, 0.18), transparent 50%);
    mix-blend-mode: screen;
    pointer-events: none;
  }

  .collections-hero__copy {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    gap: clamp(12px, 3vw, 24px);
  }

  .collections-hero__eyebrow {
    font-size: 0.82rem;
    letter-spacing: 0.28em;
    text-transform: uppercase;
    opacity: 0.75;
  }

  .collections-hero h1 {
    margin: 0;
    font-size: clamp(2.4rem, 4vw, 3.4rem);
    letter-spacing: 0.02em;
  }

  .collections-hero__subtitle {
    margin: 0;
    font-size: clamp(1.25rem, 2.8vw, 1.6rem);
    font-style: italic;
    opacity: 0.9;
  }

  .collections-hero__summary {
    margin: 0;
    font-size: 1.05rem;
    max-width: 52ch;
    line-height: 1.7;
  }

  .collections-hero__badge {
    align-self: flex-start;
    padding: 8px 16px;
    border-radius: 999px;
    font-size: 0.85rem;
    font-weight: 600;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    background: rgba(253, 249, 240, 0.18);
    border: 1px solid rgba(253, 249, 240, 0.22);
    backdrop-filter: blur(3px);
  }

  .collections-hero__seal {
    position: relative;
    z-index: 1;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .collections-hero__seal img {
    width: min(320px, 52vw);
    max-width: 100%;
    height: auto;
    filter: drop-shadow(0 22px 44px rgba(22, 13, 0, 0.55));
  }

  .collections-metrics {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 20px;
  }

  .metric-card {
    padding: 24px;
    border-radius: 22px;
    background: rgba(255, 252, 245, 0.92);
    box-shadow: 0 20px 45px -32px rgba(71, 48, 2, 0.7);
  }

  .metric-card h2 {
    margin: 0 0 8px;
    font-size: 2.1rem;
    color: var(--accent-strong);
  }

  .metric-card p {
    margin: 0;
    color: rgba(59, 46, 20, 0.72);
    font-size: 0.95rem;
  }

  .collections-tagline {
    margin: 0;
    font-size: 1.05rem;
    line-height: 1.7;
    text-align: center;
    color: rgba(59, 46, 20, 0.82);
  }

  .collections-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: clamp(18px, 3vw, 28px);
  }

  .collections-card {
    position: relative;
    display: flex;
    flex-direction: column;
    gap: 16px;
    padding: 28px;
    border-radius: 26px;
    background: linear-gradient(145deg, rgba(255, 255, 255, 0.94), rgba(236, 220, 191, 0.66));
    box-shadow: 0 18px 48px -30px rgba(59, 46, 20, 0.6);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }

  .collections-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 26px 52px -28px rgba(59, 46, 20, 0.65);
  }

  .collections-card__title {
    margin: 0;
    font-size: 1.45rem;
    color: var(--accent-strong);
  }

  .collections-card__description {
    margin: 0;
    font-size: 0.98rem;
    color: rgba(59, 46, 20, 0.78);
  }

  .collections-card__meta {
    display: flex;
    align-items: center;
    gap: 12px;
    font-size: 0.85rem;
    letter-spacing: 0.14em;
    text-transform: uppercase;
    color: rgba(59, 46, 20, 0.58);
  }

  .collections-card__link {
    align-self: flex-start;
    padding: 10px 18px;
    border-radius: 999px;
    font-weight: 600;
    font-size: 0.9rem;
    background: rgba(155, 107, 29, 0.16);
    color: var(--accent-strong);
    transition: background 0.2s ease, color 0.2s ease;
  }

  .collections-card__link:hover {
    background: rgba(155, 107, 29, 0.28);
    color: #4d3304;
  }

  .collections-footer-card {
    padding: clamp(26px, 4vw, 36px);
    border-radius: 28px;
    background: rgba(255, 255, 255, 0.94);
    border: 1px solid rgba(112, 77, 15, 0.14);
    text-align: center;
    box-shadow: 0 20px 50px -32px rgba(51, 35, 4, 0.55);
  }

  .collections-footer-card h2 {
    margin: 0 0 12px;
    font-size: clamp(1.6rem, 3vw, 2.1rem);
    color: var(--accent-strong);
  }

  .collections-footer-card p {
    margin: 0 0 18px;
    font-size: 1rem;
    color: rgba(59, 46, 20, 0.75);
  }

  .collections-footer-card a {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 20px;
    border-radius: 999px;
    font-weight: 600;
    background: var(--accent-strong);
    color: #fffaf0;
    box-shadow: 0 16px 32px -24px rgba(112, 77, 15, 0.9);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }

  .collections-footer-card a:hover {
    transform: translateY(-2px);
    box-shadow: 0 22px 38px -26px rgba(112, 77, 15, 0.9);
  }

  @media (max-width: 600px) {
    .collections-hero {
      text-align: center;
    }

    .collections-hero__badge {
      align-self: center;
    }

    .collections-hero__seal {
      order: -1;
    }

    .collections-hero__summary {
      margin: 0 auto;
    }
  }
</style>

{% assign collection_pages = site.pages | where: 'layout', 'collection' | sort: 'title' %}
{% assign total_books = 0 %}
{% for collection in collection_pages %}
  {% assign books_in_collection = site.pages | where: 'layout', 'book' | where: 'collection', collection.slug %}
  {% assign total_books = total_books | plus: books_in_collection.size %}
{% endfor %}

<div class="collections-landing">
  <section class="collections-hero">
    <div class="collections-hero__copy">
      <span class="collections-hero__badge">Sello Ex Libris · Biblioteca Ecolístico</span>
      <p class="collections-hero__eyebrow">Biblioteca Ecolístico</p>
      <h1>Colecciones vivas para una custodia circular</h1>
      <p class="collections-hero__subtitle">Ex Natura, Lumen.</p>
      <p class="collections-hero__summary">
        Desde el pensamiento crítico hasta las prácticas regenerativas, cada colección es un foco
        curatorial que resguarda el conocimiento eco-humanista que compartimos con la comunidad.
        Explora, adopta y contribuye al archivo vivo de la Biblioteca Ecolístico.
      </p>
    </div>
    <div class="collections-hero__seal" aria-hidden="true">
      <img src="/assets/images/exlibris.png" alt="Sello Ex Libris de la Biblioteca Ecolístico" loading="lazy">
    </div>
  </section>

  <section class="collections-metrics" aria-label="Indicadores de la colección general">
    <article class="metric-card">
      <h2>{{ collection_pages.size }}</h2>
      <p>Colecciones curatoriales activas</p>
    </article>
    <article class="metric-card">
      <h2>{{ total_books }}</h2>
      <p>Libros catalogados dentro del archivo</p>
    </article>
    <article class="metric-card">
      <h2>Biblioteca Ecolístico</h2>
      <p>Sello Ex Libris · Archivo vivo de custodia circular</p>
    </article>
  </section>

  <p class="collections-tagline">Biblioteca Ecolístico · Archivo vivo de custodia circular.</p>

  <section class="collections-grid" aria-label="Listado de colecciones">
    {% for collection in collection_pages %}
      {% assign books_in_collection = site.pages | where: 'layout', 'book' | where: 'collection', collection.slug %}
      {% assign book_count = books_in_collection.size %}
      <article class="collections-card">
        <header>
          <p class="collections-card__meta">{{ collection.slug | replace: '-', ' ' | upcase }}</p>
          <h2 class="collections-card__title">
            <a href="{{ collection.url | relative_url }}">{{ collection.title }}</a>
          </h2>
        </header>
        {% if collection.description %}
          <p class="collections-card__description">{{ collection.description }}</p>
        {% endif %}
        <div class="collections-card__meta">
          <span>{{ book_count }} libro{% if book_count != 1 %}s{% endif %}</span>
          {% if collection.loan_policy %}
            <span>&middot;</span>
            <span>{{ collection.loan_policy }}</span>
          {% endif %}
        </div>
        <a class="collections-card__link" href="{{ collection.url | relative_url }}">
          Explorar colección
        </a>
      </article>
    {% endfor %}
  </section>

  <section class="collections-footer-card">
    <h2>Conecta con la comunidad custodial</h2>
    <p>
      Contribuye con nuevos títulos, comparte tus lecturas o agenda una visita.
      Cada colección se enriquece con tu participación.
    </p>
    <a href="https://biblioteca.ecolistico.com" rel="noopener">Visitar biblioteca.ecolistico.com</a>
  </section>
</div>
