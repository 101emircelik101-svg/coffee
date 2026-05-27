<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mosaic Specialty Coffee — Madaba, Jordan</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Josefin+Sans:wght@200;300;400&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

  :root {
    --cream: #f5efe6;
    --parchment: #ede0cc;
    --espresso: #1a0f07;
    --mocha: #3d1f0d;
    --caramel: #c47b2b;
    --gold: #d4a44c;
    --foam: #fdf8f2;
    --stone: #7a6a5a;
  }

  html { scroll-behavior: smooth; }

  body {
    background: var(--espresso);
    color: var(--cream);
    font-family: 'Josefin Sans', sans-serif;
    font-weight: 300;
    letter-spacing: 0.04em;
    overflow-x: hidden;
  }

  /* ── NOISE OVERLAY ── */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.04'/%3E%3C/svg%3E");
    pointer-events: none;
    z-index: 1000;
    opacity: 0.35;
  }

  /* ── HERO ── */
  .hero {
    min-height: 100vh;
    display: grid;
    grid-template-columns: 1fr 1fr;
    position: relative;
    overflow: hidden;
  }

  .hero-left {
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 80px 60px 80px 80px;
    position: relative;
    z-index: 2;
  }

  .hero-eyebrow {
    font-family: 'Josefin Sans', sans-serif;
    font-weight: 200;
    font-size: 10px;
    letter-spacing: 0.4em;
    text-transform: uppercase;
    color: var(--caramel);
    margin-bottom: 32px;
    opacity: 0;
    animation: fadeUp 1s 0.2s forwards;
  }

  .hero-title {
    font-family: 'Cormorant Garamond', serif;
    font-size: clamp(52px, 6vw, 88px);
    font-weight: 300;
    line-height: 1.0;
    color: var(--cream);
    margin-bottom: 8px;
    opacity: 0;
    animation: fadeUp 1s 0.4s forwards;
  }

  .hero-title em {
    font-style: italic;
    color: var(--gold);
  }

  .hero-subtitle {
    font-family: 'Cormorant Garamond', serif;
    font-size: clamp(18px, 2vw, 28px);
    font-weight: 300;
    font-style: italic;
    color: var(--stone);
    margin-bottom: 48px;
    letter-spacing: 0.02em;
    opacity: 0;
    animation: fadeUp 1s 0.6s forwards;
  }

  .hero-stars {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 48px;
    opacity: 0;
    animation: fadeUp 1s 0.8s forwards;
  }

  .stars {
    color: var(--gold);
    font-size: 14px;
    letter-spacing: 3px;
  }

  .rating-text {
    font-size: 11px;
    letter-spacing: 0.2em;
    color: var(--stone);
    text-transform: uppercase;
  }

  .hero-divider {
    width: 60px;
    height: 1px;
    background: var(--caramel);
    margin-bottom: 36px;
    opacity: 0;
    animation: fadeUp 1s 0.9s forwards;
  }

  .hero-desc {
    font-size: 13px;
    line-height: 2;
    color: var(--stone);
    max-width: 340px;
    margin-bottom: 52px;
    opacity: 0;
    animation: fadeUp 1s 1.0s forwards;
  }

  .hero-cta {
    display: flex;
    gap: 20px;
    opacity: 0;
    animation: fadeUp 1s 1.1s forwards;
  }

  .btn-primary {
    display: inline-block;
    padding: 14px 36px;
    background: var(--caramel);
    color: var(--espresso);
    font-family: 'Josefin Sans', sans-serif;
    font-size: 10px;
    font-weight: 400;
    letter-spacing: 0.35em;
    text-transform: uppercase;
    text-decoration: none;
    transition: background 0.3s, transform 0.3s;
  }

  .btn-primary:hover { background: var(--gold); transform: translateY(-2px); }

  .btn-outline {
    display: inline-block;
    padding: 14px 36px;
    border: 1px solid var(--stone);
    color: var(--cream);
    font-family: 'Josefin Sans', sans-serif;
    font-size: 10px;
    font-weight: 400;
    letter-spacing: 0.35em;
    text-transform: uppercase;
    text-decoration: none;
    transition: border-color 0.3s, color 0.3s, transform 0.3s;
  }

  .btn-outline:hover { border-color: var(--caramel); color: var(--caramel); transform: translateY(-2px); }

  /* ── HERO RIGHT ── */
  .hero-right {
    position: relative;
    overflow: hidden;
  }

  .hero-img-container {
    position: absolute;
    inset: 0;
    opacity: 0;
    animation: fadeIn 1.4s 0.5s forwards;
  }

  /* Coffee latte art SVG illustration */
  .hero-coffee-art {
    position: absolute;
    inset: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, var(--mocha) 0%, #0d0603 100%);
  }

  .coffee-cup-svg {
    width: min(380px, 80%);
    opacity: 0;
    animation: fadeIn 1.4s 0.8s forwards;
    filter: drop-shadow(0 30px 60px rgba(0,0,0,0.8));
  }

  .hero-right::after {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 80px;
    background: linear-gradient(to right, var(--espresso), transparent);
    z-index: 3;
  }

  /* Floating label */
  .hero-location {
    position: absolute;
    bottom: 60px;
    right: 60px;
    text-align: right;
    z-index: 4;
    opacity: 0;
    animation: fadeUp 1s 1.3s forwards;
  }

  .hero-location span {
    display: block;
    font-size: 9px;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: var(--caramel);
    margin-bottom: 6px;
  }

  .hero-location p {
    font-family: 'Cormorant Garamond', serif;
    font-style: italic;
    font-size: 16px;
    color: var(--stone);
  }

  /* ── NAV ── */
  nav {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 100;
    padding: 28px 80px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: linear-gradient(to bottom, rgba(26,15,7,0.9), transparent);
    backdrop-filter: blur(4px);
  }

  .nav-logo {
    font-family: 'Cormorant Garamond', serif;
    font-size: 18px;
    font-weight: 400;
    letter-spacing: 0.1em;
    color: var(--cream);
    text-decoration: none;
  }

  .nav-logo span { color: var(--caramel); }

  .nav-links {
    display: flex;
    gap: 40px;
    list-style: none;
  }

  .nav-links a {
    font-size: 9px;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: var(--stone);
    text-decoration: none;
    transition: color 0.3s;
  }

  .nav-links a:hover { color: var(--caramel); }

  /* ── SECTION: ABOUT ── */
  .about {
    padding: 140px 80px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 100px;
    align-items: center;
    position: relative;
  }

  .about::before {
    content: '"';
    position: absolute;
    top: 60px;
    left: 60px;
    font-family: 'Cormorant Garamond', serif;
    font-size: 300px;
    color: rgba(196,123,43,0.06);
    line-height: 1;
    pointer-events: none;
  }

  .about-text {}

  .section-label {
    font-size: 9px;
    letter-spacing: 0.4em;
    text-transform: uppercase;
    color: var(--caramel);
    margin-bottom: 24px;
  }

  .section-title {
    font-family: 'Cormorant Garamond', serif;
    font-size: clamp(36px, 4vw, 58px);
    font-weight: 300;
    line-height: 1.1;
    margin-bottom: 32px;
  }

  .section-title em { font-style: italic; color: var(--gold); }

  .section-body {
    font-size: 13px;
    line-height: 2.1;
    color: var(--stone);
    margin-bottom: 24px;
  }

  .about-stats {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 40px;
    padding: 60px;
    background: rgba(255,255,255,0.02);
    border: 1px solid rgba(255,255,255,0.05);
    backdrop-filter: blur(10px);
  }

  .stat {
    text-align: center;
  }

  .stat-num {
    font-family: 'Cormorant Garamond', serif;
    font-size: 52px;
    font-weight: 300;
    color: var(--gold);
    line-height: 1;
    margin-bottom: 8px;
  }

  .stat-label {
    font-size: 9px;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: var(--stone);
  }

  /* ── SECTION: MENU ── */
  .menu-section {
    padding: 140px 80px;
    background: linear-gradient(180deg, var(--espresso) 0%, var(--mocha) 50%, var(--espresso) 100%);
  }

  .menu-header {
    text-align: center;
    margin-bottom: 80px;
  }

  .menu-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 2px;
    max-width: 1100px;
    margin: 0 auto;
  }

  .menu-category {
    padding: 48px 40px;
    background: rgba(255,255,255,0.02);
    border: 1px solid rgba(255,255,255,0.04);
    transition: background 0.4s;
    position: relative;
    overflow: hidden;
  }

  .menu-category::before {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 2px;
    background: var(--caramel);
    transform: scaleX(0);
    transform-origin: left;
    transition: transform 0.4s;
  }

  .menu-category:hover::before { transform: scaleX(1); }
  .menu-category:hover { background: rgba(196,123,43,0.05); }

  .cat-title {
    font-family: 'Cormorant Garamond', serif;
    font-size: 22px;
    font-weight: 400;
    font-style: italic;
    color: var(--gold);
    margin-bottom: 32px;
    padding-bottom: 16px;
    border-bottom: 1px solid rgba(255,255,255,0.06);
  }

  .menu-item {
    display: flex;
    justify-content: space-between;
    align-items: baseline;
    padding: 10px 0;
    border-bottom: 1px solid rgba(255,255,255,0.03);
  }

  .menu-item:last-child { border-bottom: none; }

  .item-name {
    font-size: 11px;
    letter-spacing: 0.1em;
    color: var(--cream);
  }

  .item-price {
    font-family: 'Cormorant Garamond', serif;
    font-size: 15px;
    color: var(--caramel);
    white-space: nowrap;
    margin-left: 12px;
  }

  .item-note {
    font-size: 9px;
    color: var(--stone);
    letter-spacing: 0.1em;
  }

  /* ── SECTION: HIGHLIGHTS ── */
  .highlights {
    padding: 140px 80px;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 2px;
  }

  .highlight-card {
    padding: 60px 40px;
    background: rgba(255,255,255,0.015);
    border: 1px solid rgba(255,255,255,0.04);
    text-align: center;
    transition: transform 0.4s, background 0.4s;
    position: relative;
  }

  .highlight-card:hover {
    transform: translateY(-8px);
    background: rgba(196,123,43,0.07);
  }

  .highlight-icon {
    font-size: 32px;
    margin-bottom: 24px;
    display: block;
  }

  .highlight-title {
    font-family: 'Cormorant Garamond', serif;
    font-size: 20px;
    font-weight: 400;
    color: var(--cream);
    margin-bottom: 16px;
  }

  .highlight-text {
    font-size: 11px;
    line-height: 1.9;
    color: var(--stone);
  }

  /* ── SECTION: VISIT ── */
  .visit {
    padding: 140px 80px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 100px;
    align-items: center;
    background: var(--mocha);
  }

  .visit-info {}

  .visit-detail {
    display: flex;
    gap: 24px;
    align-items: flex-start;
    padding: 28px 0;
    border-bottom: 1px solid rgba(255,255,255,0.06);
  }

  .visit-detail:first-of-type { padding-top: 0; }

  .detail-icon {
    font-size: 18px;
    margin-top: 2px;
    flex-shrink: 0;
  }

  .detail-label {
    font-size: 9px;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: var(--caramel);
    margin-bottom: 8px;
  }

  .detail-value {
    font-family: 'Cormorant Garamond', serif;
    font-size: 18px;
    font-weight: 300;
    color: var(--cream);
  }

  .detail-sub {
    font-size: 11px;
    color: var(--stone);
    margin-top: 4px;
    line-height: 1.7;
  }

  .visit-map {
    position: relative;
    height: 480px;
    background: rgba(0,0,0,0.3);
    border: 1px solid rgba(255,255,255,0.05);
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
  }

  /* Stylized map graphic */
  .map-placeholder {
    text-align: center;
    z-index: 2;
  }

  .map-placeholder p {
    font-size: 10px;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: var(--caramel);
    margin-top: 16px;
  }

  .map-pin {
    font-size: 48px;
    animation: pulse 2s ease-in-out infinite;
  }

  @keyframes pulse {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-8px); }
  }

  /* Grid background for map */
  .visit-map::before {
    content: '';
    position: absolute;
    inset: 0;
    background-image:
      linear-gradient(rgba(196,123,43,0.05) 1px, transparent 1px),
      linear-gradient(90deg, rgba(196,123,43,0.05) 1px, transparent 1px);
    background-size: 40px 40px;
  }

  /* ── FOOTER ── */
  footer {
    padding: 80px 80px 40px;
    border-top: 1px solid rgba(255,255,255,0.06);
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 60px;
  }

  .footer-brand .nav-logo {
    font-size: 24px;
    display: block;
    margin-bottom: 16px;
  }

  .footer-brand p {
    font-size: 11px;
    line-height: 1.9;
    color: var(--stone);
    max-width: 240px;
  }

  .footer-col-title {
    font-size: 9px;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: var(--caramel);
    margin-bottom: 24px;
  }

  .footer-links {
    list-style: none;
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  .footer-links a {
    font-size: 11px;
    color: var(--stone);
    text-decoration: none;
    transition: color 0.3s;
    letter-spacing: 0.05em;
  }

  .footer-links a:hover { color: var(--caramel); }

  .footer-bottom {
    grid-column: 1 / -1;
    padding-top: 40px;
    border-top: 1px solid rgba(255,255,255,0.04);
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .footer-bottom p {
    font-size: 9px;
    letter-spacing: 0.2em;
    color: var(--stone);
    text-transform: uppercase;
  }

  /* ── DECORATIVE LINE ── */
  .ornament {
    text-align: center;
    color: var(--caramel);
    opacity: 0.4;
    font-size: 14px;
    letter-spacing: 12px;
    margin: 20px 0;
  }

  /* ── ANIMATIONS ── */
  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(24px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  @keyframes fadeIn {
    from { opacity: 0; }
    to   { opacity: 1; }
  }

  /* ── SCROLL REVEAL ── */
  .reveal {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 0.8s ease, transform 0.8s ease;
  }

  .reveal.visible {
    opacity: 1;
    transform: translateY(0);
  }

  /* ── RESPONSIVE ── */
  @media (max-width: 900px) {
    nav { padding: 24px 32px; }
    .nav-links { display: none; }
    .hero { grid-template-columns: 1fr; min-height: auto; }
    .hero-left { padding: 120px 32px 60px; }
    .hero-right { height: 50vh; }
    .about { grid-template-columns: 1fr; padding: 80px 32px; gap: 60px; }
    .menu-section { padding: 80px 32px; }
    .menu-grid { grid-template-columns: 1fr; }
    .highlights { grid-template-columns: 1fr 1fr; padding: 80px 32px; }
    .visit { grid-template-columns: 1fr; padding: 80px 32px; gap: 60px; }
    .footer { grid-template-columns: 1fr; padding: 60px 32px 32px; }
  }

  /* ── PHONE CTA STRIP ── */
  .cta-strip {
    background: var(--caramel);
    padding: 28px 80px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .cta-strip p {
    font-family: 'Cormorant Garamond', serif;
    font-size: 22px;
    font-style: italic;
    color: var(--espresso);
  }

  .cta-strip a {
    font-size: 10px;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: var(--espresso);
    text-decoration: none;
    font-weight: 400;
    padding: 12px 28px;
    border: 1px solid var(--espresso);
    transition: background 0.3s, color 0.3s;
  }

  .cta-strip a:hover {
    background: var(--espresso);
    color: var(--caramel);
  }
</style>
</head>
<body>

<!-- NAV -->
<nav>
  <a href="#" class="nav-logo">Mosaic <span>✦</span></a>
  <ul class="nav-links">
    <li><a href="#about">Story</a></li>
    <li><a href="#menu">Menu</a></li>
    <li><a href="#visit">Visit</a></li>
    <li><a href="tel:+96279629 6559">Contact</a></li>
  </ul>
</nav>

<!-- HERO -->
<section class="hero">
  <div class="hero-left">
    <p class="hero-eyebrow">Specialty Coffee · Madaba, Jordan</p>
    <h1 class="hero-title">Mosaic<br><em>Specialty</em><br>Coffee</h1>
    <p class="hero-subtitle">Where every cup is a work of art.</p>
    <div class="hero-stars">
      <span class="stars">★★★★★</span>
      <span class="rating-text">5.0 · 368 Reviews</span>
    </div>
    <div class="hero-divider"></div>
    <p class="hero-desc">A bright, welcoming café in the heart of Madaba — crafting exceptional specialty coffee with warmth, precision, and passion for the craft.</p>
    <div class="hero-cta">
      <a href="#menu" class="btn-primary">View Menu</a>
      <a href="#visit" class="btn-outline">Find Us</a>
    </div>
  </div>

  <div class="hero-right">
    <div class="hero-img-container">
      <div class="hero-coffee-art">
        <!-- Stylized coffee SVG -->
        <svg class="coffee-cup-svg" viewBox="0 0 400 480" fill="none" xmlns="http://www.w3.org/2000/svg">
          <!-- Saucer -->
          <ellipse cx="200" cy="400" rx="160" ry="28" fill="#2a1208" opacity="0.8"/>
          <ellipse cx="200" cy="395" rx="155" ry="24" fill="#3d1f0d"/>
          <!-- Cup body -->
          <path d="M80 220 Q70 380 120 390 Q200 405 280 390 Q330 380 320 220 Z" fill="#1a0f07"/>
          <path d="M85 218 Q75 375 123 388 Q200 402 277 388 Q325 375 315 218 Z" fill="#2d1409"/>
          <!-- Glass effect -->
          <path d="M90 222 Q82 360 125 382 L200 395 L275 382 Q318 360 310 222 Z" fill="url(#cupGrad)"/>
          <!-- Coffee surface -->
          <ellipse cx="200" cy="222" rx="110" ry="22" fill="url(#coffeeTop)"/>
          <!-- Latte art - heart/tulip -->
          <g opacity="0.9">
            <ellipse cx="200" cy="218" rx="105" ry="20" fill="#c47b2b"/>
            <!-- Foam art -->
            <path d="M200 200 Q185 210 175 218 Q185 226 200 224 Q215 226 225 218 Q215 210 200 200Z" fill="#f5efe6" opacity="0.85"/>
            <path d="M200 204 Q188 212 180 220 Q190 226 200 225 Q210 226 220 220 Q212 212 200 204Z" fill="#fdf8f2" opacity="0.7"/>
            <!-- Tulip top -->
            <ellipse cx="200" cy="200" rx="18" ry="14" fill="#fdf8f2" opacity="0.8"/>
            <ellipse cx="200" cy="200" rx="12" ry="9" fill="#f5efe6" opacity="0.6"/>
            <!-- Stem line -->
            <line x1="200" y1="214" x2="200" y2="222" stroke="#c47b2b" stroke-width="1.5" opacity="0.7"/>
          </g>
          <!-- Handle -->
          <path d="M320 260 Q370 260 370 310 Q370 360 320 360" stroke="#3d1f0d" stroke-width="22" fill="none" stroke-linecap="round"/>
          <path d="M320 262 Q365 262 365 310 Q365 358 320 358" stroke="#2d1409" stroke-width="14" fill="none" stroke-linecap="round"/>
          <!-- Steam -->
          <path d="M160 190 Q155 170 162 150 Q169 130 164 110" stroke="#c47b2b" stroke-width="1.5" fill="none" opacity="0.4" stroke-linecap="round">
            <animate attributeName="opacity" values="0.4;0.1;0.4" dur="3s" repeatCount="indefinite"/>
          </path>
          <path d="M200 185 Q195 165 202 145 Q209 125 204 105" stroke="#c47b2b" stroke-width="1.5" fill="none" opacity="0.4" stroke-linecap="round">
            <animate attributeName="opacity" values="0.4;0.1;0.4" dur="3s" begin="0.5s" repeatCount="indefinite"/>
          </path>
          <path d="M240 190 Q245 170 238 150 Q231 130 236 110" stroke="#c47b2b" stroke-width="1.5" fill="none" opacity="0.4" stroke-linecap="round">
            <animate attributeName="opacity" values="0.4;0.1;0.4" dur="3s" begin="1s" repeatCount="indefinite"/>
          </path>
          <defs>
            <linearGradient id="cupGrad" x1="0" y1="0" x2="0" y2="1">
              <stop offset="0%" stop-color="#3d2010"/>
              <stop offset="100%" stop-color="#1a0a04"/>
            
