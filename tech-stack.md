# Stack Tecnologico e Scelte di Design

Questo documento riassume tutte le scelte tecnologiche, i programmi installati e le decisioni di design adottate per lo sviluppo di questo sito web in React e Vite.

---

## 1. Stack Tecnologico Principale

*   **React (JavaScript)**: Libreria di riferimento per la creazione di interfacce utente dinamiche, che permette di strutturare la pagina in componenti isolati e riutilizzabili. Gestisce reattivamente le interazioni come i filtri del portfolio e lo stato del menu mobile.
*   **Vite**: Strumento di build moderno che sostituisce le vecchie configurazioni più lente (es. Webpack). Garantisce un server di sviluppo istantaneo con HMR (Hot Module Replacement) e una compilazione di produzione estremamente ottimizzata.

---

## 2. Gestione del Layout e Stile

*   **Vanilla CSS (CSS Variables / Custom Properties)**: Nessun framework CSS esterno (come Tailwind o Bootstrap) per evitare codice superfluo e garantire la massima velocità di caricamento delle pagine.
*   **Layout Moderno**: Utilizzo combinato di **CSS Grid** (per griglie asimmetriche responsive) e **Flexbox** (per allineamenti e strutture a blocchi).
*   **Design Responsivo**: Il foglio di stile è strutturato con Media Queries per adattarsi fluidamente a qualsiasi dispositivo (Desktop, Tablet e Smartphone).

---

## 3. Estetica e Design System

Il design si ispira a layout premium in stile "digital agency":
*   **Modalità Scura Cyber**:
    *   *Sfondo del sito*: Slate scuro/nero profondo (`#070b13`).
    *   *Sfondo delle schede*: Grigio scuro semitrasparente (`rgba(17, 24, 39, 0.6)`).
    *   *Colori accento/neon*: Cyan (`#00f2fe`) e Electric Blue (`#4facfe`).
*   **Effetti Visivi**:
    *   **Glassmorphism**: Sfrutta la proprietà `backdrop-filter: blur(10px)` con sfondi semitrasparenti per navbar e card, dando profondità all'interfaccia.
    *   **Glowing Blobs**: Tre ampie sfumature radiali sfocate posizionate in punti strategici sullo sfondo per creare un'illuminazione ambientale sfumata.
    *   **Grafica SVG Animata**: Una rappresentazione interattiva nella sezione Hero con tracciati animati via CSS per simulare il passaggio di flussi di dati.
*   **Tipografia**:
    *   **Outfit**: Caricato via Google Fonts, utilizzato per titoli e slogan ad alto impatto per conferire un aspetto moderno e sofisticato.
    *   **Inter**: Caricato via Google Fonts, ottimizzato per i testi descrittivi ed elementi di input grazie alla sua straordinaria leggibilità.

---

## 4. Ambiente di Sviluppo e Strumenti Installati

Durante la sessione sono stati configurati i seguenti componenti sul sistema:
*   **Node.js LTS (v24.19.0)**: Installato tramite Windows Package Manager (`winget`).
*   **NPM (v11.17.0)**: Gestore ufficiale di pacchetti installato automaticamente con Node.js.

---

## 5. SEO & Ottimizzazione delle Prestazioni

*   **SEO On-Page**: Utilizzo di tag semantici HTML5 (`<header>`, `<main>`, `<section>`, `<footer>`), tag descrittivo `<meta name="description">` e configurazione della lingua della pagina in italiano (`lang="it"`).
*   **Scroll Detection**: Uno hook di effetto in React rileva lo scorrimento della finestra e riduce l'altezza e l'opacità della navbar in tempo reale, ottimizzando lo spazio visivo per l'utente.
