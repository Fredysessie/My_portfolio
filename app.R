## Version 1

library(shiny)
library(shinythemes)
library(fontawesome)
library(slickR)
library(htmltools)
library(shinyjs)
library(shinyalert)
# library(bslib)

ui <- fluidPage(
  useShinyjs(),
  # useShinyalert(),
  # Ajout du bouton mode jour/nuit
  absolutePanel(
    id = "theme-toggle",
    fixed = TRUE,
    right = 20,
    top = 20,
    actionButton(
      "themeToggle",
      "",
      icon = icon("sun"),
      style = "
        background: none;
        border: none;
        color: #03b1dc;
        font-size: 20px;
        transition: transform 0.3s ease;
      "
    )
  ),
  tags$head(
    # Ajouter cette ligne pour le titre du site
    tags$title("Portfolio - Koffi Frederic SESSIE"),
    tags$style(HTML("
      .header, .footer {
        background-color: #1c116c;
        color: white;
        text-align: center;
        padding: 15px 0;
        width: 100%;
      }
      .header a, .footer a {
        color: white !important;
        text-decoration: none;
        transition: color 0.3s ease;
      }
      .header a:hover, .footer a:hover {
        color: #03b1dc !important;
        text-decoration: none;
      }
      .footer {
        position: relative;
        bottom: 0;
        margin-top: 20px;
        text-align: left !important;  /* Force l'alignement à gauche */
      }
      .footer h5 {
        text-align: left !important;
      }

      .footer .row div {
        margin-bottom: 10px;
      }
      .footer p, .footer ul {
        text-align: left !important;
        padding-left: 0 !important;
      }

      .footer .container {
        text-align: left !important;
      }
      .nav-tabs > li > a {
        color: #1c116c;
      }
      .nav-tabs > li.active > a {
        background-color: #1c116c !important;
        color: white !important;
      }

      .btn-primary {
        background-color: #1c116c;
        border-color: #1c116c;

      }
      .btn-primary:hover {
        background-color: #03b1dc;
        border-color: #03b1dc;
      }
      .sidebar-links a {
        color: #1c116c !important;
      }
      .sidebar-links a:hover {
        color: #03b1dc !important;
      }
      .flag-icon {
        width: 25px;
        height: 18px;
        margin-right: 10px;
        vertical-align: middle;
      }
      .language-item {
        margin-bottom: 15px;
        font-size: 16px;
        display: flex;
        align-items: center;
      }
      .header-location {
        display: inline-flex;
        align-items: center;
        gap: 8px;
      }
      .fa-location-dot {
        color: #03b1dc;
      }
      .skill-item {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
        padding: 8px;
        transition: transform 0.3s ease;
        cursor: pointer;
      }
      .skill-item:hover {
        transform: scale(1.05);
        color: #03b1dc;
      }
      .skill-item:hover i {
        transform: scale(1.2);
        color: #1c116c !important;
      }
      .skill-item i {
        margin-right: 10px;
        transition: transform 0.3s ease;
      }
      .tech-skills-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        padding: 20px;
      }
      .tech-skill-item {
        background: white;
        padding: 15px;
        border-radius: 8px;
        text-align: center;
        transition: all 0.3s ease;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 10px;
      }
      .tech-skill-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      }
      .tech-skill-item i {
        font-size: 24px;
        color: #03b1dc;
      }
      .project-card {
        background: #f8f9fa;
        border-radius: 8px;
        padding: 20px;
        margin: 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      }
      .project-card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-radius: 4px;
        margin-bottom: 15px;
      }
      .project-card h4 {
        color: #1c116c;
        margin-bottom: 10px;
      }
      .project-card a {
        color: #03b1dc;
        text-decoration: none;
      }
      .project-card a:hover {
        color: #1c116c;
      }

      .project-image-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 200px;  /* Ajustez la hauteur selon vos besoins */
        overflow: hidden;
}

.project-image {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
    margin: auto;
}

      .slick-prev:before, .slick-next:before {
        color: #1c116c !important;
      }
      .section-title {
        color: #1c116c;
        border-bottom: 2px solid #03b1dc;
        padding-bottom: 10px;
        margin-bottom: 20px;
      }

    .education-card {
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 30px;
        margin: 20px;
        transition: transform 0.3s ease;
      }
      .education-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      }
      .education-title {
        color: #1c116c;
        font-weight: bold;
        margin-bottom: 10px;
        padding-left: 10px;
      }
      .education-subtitle {
        color: #03b1dc;
        font-style: italic;
        margin-bottom: 15px;
        padding-left: 10px;
      }
      .course-list {
        margin-left: 30px;
        color: #666;
        padding-left: 10px;
      }
      .course-list li {
        margin-bottom: 8px;
      }
      .certificate-item {
        display: flex;
        align-items: center;
        gap: 15px;
        margin: 15px 10px;
        padding: 15px;
        background: white;
        border-radius: 6px;
        transition: transform 0.3s ease;
      }
      .certificate-item:hover {
        transform: scale(1.02);
      }
      .certificate-icon {
        color: #03b1dc;
        font-size: 24px;
      }
      .date-label {
        color: #666;
        font-size: 0.9em;
        padding-left: 10px;
      }
      h3 {
        padding-left: 10px;
      }
      p {
        padding-left: 10px;
      }
      /* Nouveaux styles pour les langues et hobbies */
      .languages-hobbies-container {
        display: flex;
        gap: 30px;
        padding: 20px;
      }

      .language-section, .hobbies-section {
        flex: 1;
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 25px;
        transition: transform 0.3s ease;
      }

      .language-section:hover, .hobbies-section:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      }

      .language-item {
        background: white;
        margin-bottom: 15px;
        padding: 15px;
        border-radius: 6px;
        display: flex;
        align-items: center;
        transition: transform 0.3s ease;
      }

      .language-item:hover {
        transform: scale(1.02);
        box-shadow: 0 3px 10px rgba(0,0,0,0.1);
      }

      .language-info {
        display: flex;
        flex-direction: column;
        margin-left: 15px;
      }

      .language-name {
        font-weight: bold;
        color: #1c116c;
      }

      .language-level {
        color: #03b1dc;
        font-size: 0.9em;
      }

      .hobby-item {
        background: white;
        margin-bottom: 15px;
        padding: 15px;
        border-radius: 6px;
        display: flex;
        align-items: center;
        gap: 15px;
        transition: transform 0.3s ease;
      }

      .hobby-item:hover {
        transform: scale(1.02);
        box-shadow: 0 3px 10px rgba(0,0,0,0.1);
      }

      .hobby-icon {
        color: #03b1dc;
        font-size: 24px;
        min-width: 30px;
      }

      .section-title {
        color: #1c116c;
        border-bottom: 2px solid #03b1dc;
        padding-bottom: 10px;
        margin-bottom: 20px;
        text-transform: uppercase;
      }


      /* style du formulaire */
      .modal-content {
        border-radius: 8px;
        background-color: #f2f2f2;
      }
      .modal-title {
        width: 100%;
        text-align: center;
        color: #1c116c;
        text-transform: uppercase;
        font-weight: bold;
      }
      .form-label {
        font-weight: bold;
        margin-bottom: 8px;
        display: block;
      }
      .form-control {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 16px;
      }
      .form-control:focus {
        border-color: #1c116c;
        box-shadow: 0 0 0 0.2rem rgba(28, 17, 108, 0.25);
      }
      #send_mail {
        background-color: #1255a2;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: auto;
        min-width: 180px;
        margin: 0 auto;
        display: block;
        transition: background-color 0.3s ease;
        }

      #send_mail:hover {
        background-color: #1872D9;

      }
      #send_mail .fa {
      margin-left: 8px;
      }
      .captcha-container {
        display: flex;
        align-items: center;
        margin: 15px 0;
      }
      .captcha-container .form-check {
        margin: 0;
        padding: 0;
      }
      .captcha-container .form-check-input {
        margin: 0;
      }
      .captcha-container .form-check-label {
        margin-left: 2px;
        user-select: none;
      }
      .error-message {
        color: red;
        font-size: 0.8em;
        margin-top: -10px;
        margin-bottom: 10px;
      }
      .message-counter {
        color: #666;
        font-size: 0.8em;
        text-align: right;
        margin-top: -12px;
        margin-bottom: 10px;
      }

      #theme-toggle {
        z-index: 1000;
        }

      #themeToggle:hover {
        transform: scale(1.1);
      }


      /* Styles pour le mode sombre */
      body.dark-mode {
      background-color: #1a1a1a;
      color: #ffffff;
      }

      .dark-mode img {
      border: 1px solid white !important;
      }

      .dark-mode .nav-tabs > li > a:hover {
    background-color: #333333 !important;
    color: #03b1dc !important;
    border-color: #444444 !important;
      }

      .dark-mode .course-list li {
    color: white !important;
      }

    .dark-mode .nav-tabs {
    background-color: #1a1a1a;
    }

    .dark-mode .error-message {
        color: #03b1dc;
      }
      .dark-mode .message-counter {
        color: #03b1dc;
      }

      /* Style pour le select et ses options en mode sombre */
    .dark-mode .selectize-dropdown-content .option {
        background-color: #1a1a1a !important;
            color: white !important;
    }

    /* Style pour l'option survolée/active */
.dark-mode .selectize-dropdown-content .option:hover,
.dark-mode .selectize-dropdown-content .option.active {
    background-color: #333333 !important;
    color: #03b1dc !important;
}

/* Style pour le select lui-même */
.dark-mode .selectize-input {
    background-color: #1a1a1a !important;
    color: white !important;
    border-color: #444444 !important;
}

/* Style pour le select quand il est actif/focus */
.dark-mode .selectize-input.focus {
    border-color: #03b1dc !important;
    box-shadow: 0 0 0 0.2rem rgba(3, 177, 220, 0.25) !important;
}


    .dark-mode .nav-tabs > li > a {
        color: #ffffff !important;
    }

    .dark-mode .nav-tabs > li.active > a {
    background-color: #1a1a1a !important;
        color: #03b1dc !important;
    }

    .dark-mode .tab-content {
    background-color: #000000;
        color: #ffffff;
    }

    .dark-mode .tab-pane {
    background-color: #212529;
        color: #ffffff;
    }

    .dark-mode .sidebarPanel {
    background-color: #1a1a1a !important;
    }

    .dark-mode .well {
        background-color: #1a1a1a !important;
            border-color: #2d2d2d;
    }



/* Pour les textes en gras dans les li */
.dark-mode .well li span strong {
    color: #03b1dc !important;
}


.dark-mode .well span,
.dark-mode .well p strong {
    color: #03b1dc !important;
}


    .dark-mode .header,
    .dark-mode .footer {
        background-color: #212529;
    }

    .dark-mode .footer2 {
        background-color: #2d2d2d !important;
        color: #03b1dc !important;
    }

    .dark-mode h3,
    .dark-mode h1,
    .dark-mode h4 {
      color: #03b1dc !important;
      }


    .dark-mode .education-title,
    .dark-mode .education-sub,
    .dark-mode .section-title {
        color: #ffffff !important;
    }

    .dark-mode .project-card {
      background: #212529 ;
      color: #ffffff;
    }

    .dark-mode .project-card h4,
    .dark-mode .project-card p,
    .dark-mode .project-card a {
      color: #ffffff;
    }

    .dark-mode .slick-prev:before, .dark-mode .slick-next:before {
        color: #ffffff !important;
      }

    /* Style pour le titre du modal en mode sombre */
    .dark-mode .modal-title {
        color: #ffffff !important;
    }

    /* Style pour le fond du modal en mode sombre */
    .dark-mode .modal-content {
        background-color: #212529 !important;
    }

    /* Style pour les labels du formulaire en mode sombre */
    .dark-mode .form-label {
        color: #ffffff !important;
    }

    /* Style pour les inputs en mode sombre */
    .dark-mode .modal-content input,
    .dark-mode .modal-content textarea,
    .dark-mode .modal-content select {
    background-color: #333333 !important;
        color: white !important;
    border-color: #444444 !important;
    }

    /* Style pour le placeholder en mode sombre */
    .dark-mode .modal-content input::placeholder,
    .dark-mode .modal-content textarea::placeholder {
    color: #888888 !important;
    }

    /* Style pour le compteur de message en mode sombre */
    .dark-mode .message-counter {
        color: white !important;
    }

    /* Style pour le texte du captcha en mode sombre */
    .dark-mode .form-check-label {
        color: white !important;
    }

    .dark-mode .sidebar-links a {
        color: #000000 !important;
    }

    .dark-mode .language-name{
        color: #ffffff !important;
    }


    .dark-mode .slick-slide {
    background-color: #1a1a1a !important;
  }

    .dark-mode .glob-tech-skills-grid {
        background: #222 !important;
      }

    .dark-mode .glob-tech-skills-grid li{
    color: #ffffff ;
    }

    /*.dark-mode .glob-tech-skills-grid li:hover i{
    color: #03b1dc !important;
        } */

    .dark-mode .tech-skills-grid .tech-skill-item{
    color: #ffffff ;
    }

    .dark-mode .tech-skills-grid .tech-skill-item:hover i{
      color: #03b1dc !important;
    }

    .dark-mode .tech-skill-item {
        background: #2d2d2d !important;
    }

    .dark-mode .tech-skill-item i {
        color: #03b1dc;
    }

    .dark-mode .skill-item:hover i{
    color: #ffffff !important;
    }

      .dark-mode .education-card .education-subtitle {
    color: #03b1dc !important;
      }



    .dark-mode .skill-item,
    .dark-mode .language-section,
    .dark-mode .hobbies-section {
        background-color: #2d2d2d;
    }

    .dark-mode .education-card{
        background-color: #1a1a1a;
    }

    .dark-mode .language-item ,
    .dark-mode .hobby-item {
        background-color: #1a1a1a;
    }

    .dark-mode .education-card div p {
      color: #ffffff !important;
    }

    .dark-mode .certificate-item {
      background-color: #212529 !important;
    }

    .dark-mode .tech-skills-grid {
        background: #212529 !important;
    }

    .dark-mode #themeToggle {
      color: #ffffff !important;
        }

    .dark-mode .btn-primary {
    background-color: #1c116c;
            border-color: #000000;
    }

    .dark-mode .btn-primary:hover {
    background-color: #03b1dc;
            border-color: #03b1dc;
    }

    .dark-mode #showContactForm {
    background-color: #2d2d2d;
        color: #ffffff;
        border-color: #ffffff;
        }

    .dark-mode #showContactForm:hover {
    background-color: #000000;
        color: #03b1dc;
        border-color: #03b1dc;
    }

    .dark-mode .captcha-container {
        color: #ffffff;
      }

    ")),
    # Ajoutez ce script JavaScript
    tags$script("
    function scrollToTop() {
      window.scrollTo(0, 0);
    }
  ")
  ),

  # Header
  div(
    class = "header",
    tags$h1("Koffi Frederic SESSIE")
  ),

  # Body
  sidebarLayout(
    sidebarPanel(
      style = "background-color: #f8f9fa; border: 1px solid #ced4da; border-radius: 8px; padding: 20px;",
      tags$img(
        src = "Photo_CV_Fredy.png",
        # src = "Photo_CV_Fredy.JPG",
        alt = "Photo de Profil",
        width = "100%",
        style = "border-radius: 50%; margin-bottom: 20px; border: 1px solid #f8f9fa;"
        # style = "border-radius: 50%; margin-bottom: 20px;"
      ),
      h3("À propos de moi", style = "color: #1c116c; text-align: center; font-weight: bold;"),
      p(HTML("Doté d'une expertise en programmation <strong>VBA</strong>, <strong>R</strong> et <strong>Python</strong>, je suis passionné par l'<strong>analyse de crédits</strong> et la <strong>gestion des risques</strong>."),
        style = "text-align: justify;"),
      p(HTML("À l'écoute de nouvelles opportunités, je suis déterminé à m'investir pleinement dans toutes les missions qui me seront confiées et à vous apporter une valeur ajoutée significative."),
        style = "text-align: justify;"),
      br(),
      # p("Postes recherchés :", style = "color: #1c116c; font-weight: bold; font-size: 1.3em;"),
      p(HTML('<span style="color: #1c116c; font-size: 1.25em; font-weight: bold;">Postes recherchés </span> :')),
      tags$ul(
        style = "margin-left: 20px; text-align: justify;",
        tags$li(HTML('<span style="color: #1c116c;"><strong>Analyste Crédits</strong></span> - Appétence pour l\'évaluation des risques et analyse financière approfondie.')),
        br(),
        tags$li(HTML('<span style="color: #1c116c;"><strong>Analyste Risques</strong></span> - Spécialiste en gestion et modélisation des risques financiers.')),
        br(),
        tags$li(HTML('<span style="color: #1c116c;"><strong>Analyste Financier</strong></span> - Maîtrise des analyses fondamentales et techniques.')),
        br(),
        tags$li(HTML('<span style="color: #1c116c;"><strong>Data Analyst / Data Scientist</strong></span> - Je possède une expertise en analyse de données et développement d\'outils financiers.'))
      ),
      br(),
      p(HTML('<span style="color: #1c116c; font-size: 1.25em;">Type de contrat </span> : <strong>CDI</strong>, <strong>CDD</strong> ou <strong>Interim</strong>'),
        style = "margin-top: 10px; font-weight: bold;"),

      br(),
      # h3("Liens", style = "color: #1c116c;"),
      # div(
      #   class = "sidebar-links",
      #   tags$ul(
      #     style = "list-style: none; padding-left: 0;",
      #     tags$li(icon("linkedin"), a("LinkedIn", href = "https://www.linkedin.com/in/sk-fred/", target = "_blank")),
      #     tags$li(icon("github"), a("GitHub (BRVM)", href = "https://github.com/Koffi-Fredysessie/BRVM", target = "_blank")),
      #     tags$li(icon("github"), a("GitHub (Euronext)", href = "https://github.com/Fredysessie/Euronext", target = "_blank")),
      #     tags$li(icon("r-project"), a("Rpubs", href = "https://rpubs.com/Fredysessie", target = "_blank"))
      #   )
      # ),
      div(
        style = "text-align: center; margin-top: 20px;",
        downloadButton("download_cv", "Télécharger le CV", class = "btn btn-primary")
      )
      # downloadButton("download_cv", "Télécharger le CV", class = "btn btn-primary", align = "center")
    ),

    mainPanel(
      tabsetPanel(
        id = "tabs",
        # tabPanel(
        #   # "Expériences",
        #   "EXPÉRIENCES",
        #   br(),
        #   h4("Analyste financier et Analyste crédit", style = "color: #1c116c;"),
        #   p("Volkswagen BANK, 07/2024 - 12/2024", style = "font-weight: bold;"),
        #   tags$ul(
        #     tags$li("Évaluer le niveau de risque des partenaires financiers."),
        #     tags$li("Analyse approfondie des liasses fiscales, rapports consolidés."),
        #     tags$li("Attribuer des ratings financiers et des lignes de financement.")
        #   ),
        #   br(),
        #   h4("Analyste financier - Création & Développement de packages financiers R", style = "color: #1c116c;"),
        #   p("Projet d'entrepreneuriat, 02/2023-03/2024", style = "font-weight: bold;"),
        #   # Euronext section
        #   div(
        #     style = "margin-left: 20px;",
        #     p("Euronext (2024) :", style = "font-weight: bold; margin-bottom: 10px;"),
        #     tags$ul(
        #       tags$li("Outil avancé pour récupérer, traiter et analyser les données financières"),
        #       tags$li("Calculer les ratios financiers (liquidité et solvabilité) des sociétés cotées"),
        #       tags$li("Faciliter les analyses approfondies"),
        #       tags$li("Aide à la prise de décisions éclairées (achat, vente ou conservation d'actions)")
        #     )
        #   ),
        #
        #   # BRVM section
        #   div(
        #     style = "margin-left: 20px;",
        #     p("BRVM - Bourse Régionale des Valeurs Mobilières (2023) :",
        #       style = "font-weight: bold; margin-bottom: 10px; margin-top: 15px;"),
        #     tags$ul(
        #       tags$li("Similaire à Euronext mais spécifique aux données de la BRVM"),
        #       tags$li("Faciliter les analyses fondamentales et technique")
        #     )
        #   ),
        #   br(),
        #   h4("Analyste risque et ingénieur financier", style = "color: #1c116c;"),
        #   p("FASEG Investment Club, 08/2022 - 09/2023", style = "font-weight: bold;"),
        #   tags$ul(
        #     tags$li("Gestion du risque et optimisation du portefeuille."),
        #     tags$li("Analyser et cartographier les risques"),
        #     tags$li("Participer aux reportings hebdomadaires."),
        #     tags$li("Déployer les fonctionnalités avancées de mon package R BRVM pour enrichir la plateforme de SUNUFinance en cours de développement.")
        #     # ,
        #     # tags$li(""),
        #   )
        # ),
        tabPanel(
          "EXPÉRIENCES",
          div(
            style = "padding-left: 20px;",  # Ajout du padding pour tout le contenu
            br(),
            h4("Analyste financier et Analyste crédit", style = "color: #1c116c;"),
            p("Volkswagen BANK, 07/2024 - 12/2024", style = "font-weight: bold;"),
            tags$ul(
              tags$li("Évaluer le niveau de risque des partenaires financiers."),
              tags$li("Analyse approfondie des liasses fiscales, rapports consolidés."),
              tags$li("Attribuer des ratings financiers et des lignes de financement.")
            ),
            br(),
            h4("Analyste financier - Création & Développement de packages financiers R", style = "color: #1c116c;"),
            p("Projet d'entrepreneuriat, 02/2023-03/2024", style = "font-weight: bold;"),
            # Euronext section
            div(
              style = "margin-left: 20px;",
              p("Euronext (2024) :", style = "font-weight: bold; margin-bottom: 10px;"),
              tags$ul(
                tags$li("Outil avancé pour récupérer, traiter et analyser les données financières"),
                tags$li("Calculer les ratios financiers (liquidité et solvabilité) des sociétés cotées"),
                tags$li("Faciliter les analyses approfondies"),
                tags$li("Aide à la prise de décisions éclairées (achat, vente ou conservation d'actions)")
              )
            ),

            # BRVM section
            div(
              style = "margin-left: 20px;",
              p("BRVM - Bourse Régionale des Valeurs Mobilières (2023) :",
                style = "font-weight: bold; margin-bottom: 10px; margin-top: 15px;"),
              tags$ul(
                tags$li("Similaire à Euronext mais spécifique aux données de la BRVM"),
                tags$li("Faciliter les analyses fondamentales et technique")
              )
            ),
            br(),
            h4("Analyste risque et ingénieur financier", style = "color: #1c116c;"),
            p("FASEG Investment Club, 08/2022 - 09/2023", style = "font-weight: bold;"),
            tags$ul(
              tags$li("Gestion du risque et optimisation du portefeuille."),
              tags$li("Analyser et cartographier les risques"),
              tags$li("Participer aux reportings hebdomadaires."),
              tags$li("Déployer les fonctionnalités avancées de mon package R BRVM pour enrichir la plateforme de SUNUFinance en cours de développement."),
              br()
            )
          )
        ),
        tabPanel(
          # "Parcours académique",
          "PARCOURS ACADÉMIQUE",
          style = "color: #1c116c;",
          br(),

          # Formation en cours
          div(class = "education-card",
              h3("Formation en cours (Soutenance prévue en Février 2025)", style = "border-bottom: 2px solid #03b1dc; padding-bottom: 10px;"),
              div(
                h4(class = "education-title", "Master 2 - Stratégie Ingénierie et Innovation Financière"),
                p(class = "education-subtitle", "Université Paris Saclay"),
                # p("Quelques cours étudiés :"),
                p(class = "education-sub", "Quelques cours étudiés :"),
                tags$ul(class = "course-list",
                        tags$li("Gestion des risques"),
                        tags$li("Informatique financière"),
                        tags$li("Diagnostic financier approfondi"),
                        tags$li("Private equity"),
                        tags$li("Consolidation des comptes"),
                        tags$li("Produits et Marchés financiers")
                )
              )
          ),

          # Formation précédente
          div(class = "education-card",
              h3("Formation précédente", style = "border-bottom: 2px solid #03b1dc; padding-bottom: 10px;"),
              div(
                h4(class = "education-title", "Master 2 en Monnaie Banque Finance"),
                p(class = "education-subtitle", "Université Cheikh Anta Diop"),
                p(class = "date-label", "08/2020 - 03/2022 : Mention TRÈS-BIEN et Major de promotion"),
                # p("Quelques cours étudiés :"),
                p(class = "education-sub", "Quelques cours étudiés :"),
                tags$ul(class = "course-list",
                        tags$li("Gestion de portefeuille"),
                        tags$li("Finance inclusive"),
                        tags$li("Firme bancaire"),
                        tags$li("Économétrie des variables qualitatives (scoring et analyse KYC)")
                )
              )
          ),

          # Diplômes
          div(class = "education-card",
              h3("Diplômes", style = "border-bottom: 2px solid #03b1dc; padding-bottom: 10px;"),
              tags$ul(style = "list-style: none; padding-left: 0;",
                      tags$li(
                        class = "certificate-item",
                        icon("graduation-cap", class = "certificate-icon"),
                        div(
                          p(style = "margin: 0;", strong("Master 2 en Monnaie Banque Finance")),
                          p(style = "margin: 0; color: #666;", "Université Cheikh Anta Diop, SENEGAL")
                        )
                      ),
                      tags$li(
                        class = "certificate-item",
                        icon("graduation-cap", class = "certificate-icon"),
                        div(
                          p(style = "margin: 0;", strong("Licence en Economie et Finance Internationale")),
                          p(style = "margin: 0; color: #666;", "Université de Kara, TOGO")
                        )
                      )
              )
          ),

          # Certificats et attestations
          div(class = "education-card",
              h3("Certificats et attestations", style = "border-bottom: 2px solid #03b1dc; padding-bottom: 10px;"),
              tags$ul(style = "list-style: none; padding-left: 0;",
                      tags$li(
                        class = "certificate-item",
                        icon("certificate", class = "certificate-icon"),
                        div(
                          p(style = "margin: 0;", strong("Applied Data Science")),
                          p(style = "margin: 0; color: #666;", "WorldQuant University - 10/2024")
                        )
                      ),
                      tags$li(
                        class = "certificate-item",
                        icon("python", class = "certificate-icon"),
                        div(
                          p(style = "margin: 0;", strong("Apprendre à coder avec Python")),
                          p(style = "margin: 0; color: #666;", "ULB - Université Libre de Bruxelles - 05/2021")
                        )
                      ),
                      tags$li(
                        class = "certificate-item",
                        icon("piggy-bank", class = "certificate-icon"),
                        div(
                          p(style = "margin: 0;", strong("Comment gérer efficacement son épargne et ses placements ?")),
                          p(style = "margin: 0; color: #666;", "Institut National de la Consommation - 12/2020")
                        )
                      ),
                      tags$li(
                        class = "certificate-item",
                        icon("language", class = "certificate-icon"),
                        div(
                          p(style = "margin: 0;", strong("Unlock Your English")),
                          p(style = "margin: 0; color: #666;", "IMT - 08/2020")
                        )
                      ),
                      tags$li(
                        class = "certificate-item",
                        icon("chart-simple", class = "certificate-icon"),
                        div(
                          p(style = "margin: 0;", strong("Introduction à la statistique avec R")),
                          p(style = "margin: 0; color: #666;", "Université Paris-Sud - 05/2020")
                        )
                      )
              )
          )
        ),
        tabPanel(
          # "Compétences",
          "COMPÉTENCES",
          style = "color: #1c116c;",
          br(),
          div(
            style = "display: flex; flex-direction: column; gap: 30px;",

            # Container pour Soft Skills et Hard Skills
            div(
              style = "display: flex; gap: 30px;",

              # Soft Skills
              div(
                style = "flex: 1;",
                div(class ="glob-tech-skills-grid",
                    style = "background-color: #f8f9fa; padding: 20px; border-radius: 8px; height: 100%;",
                    h3("Soft Skills", style = "color: #1c116c; border-bottom: 2px solid #03b1dc; padding-bottom: 10px; font-weight: bold;"),
                    tags$ul(
                      style = "list-style: none; padding-left: 0;",
                      tags$li(
                        class = "skill-item",
                        icon("check", style = "color: #03b1dc;"),
                        "Capacité d'analyse et de synthèse"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("check", style = "color: #03b1dc;"),
                        "Curiosité intellectuelle"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("check", style = "color: #03b1dc;"),
                        "Force de proposition"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("check", style = "color: #03b1dc;"),
                        "Rigueur"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("check", style = "color: #03b1dc;"),
                        "Autonomie et esprit d'équipe"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("check", style = "color: #03b1dc;"),
                        "Réactif"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("check", style = "color: #03b1dc;"),
                        "Sens des responsabilités"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("check", style = "color: #03b1dc;"),
                        "Travail sous pression"
                      )
                    )
                )
              ),

              # Hard Skills
              div(
                style = "flex: 1;",
                div(class ="glob-tech-skills-grid",
                    style = "background-color: #f8f9fa; padding: 20px; border-radius: 8px; height: 100%;",
                    h3("Hard Skills", style = "color: #1c116c; border-bottom: 2px solid #03b1dc; padding-bottom: 10px; font-weight: bold;"),
                    tags$ul(
                      style = "list-style: none; padding-left: 0;",
                      tags$li(
                        class = "skill-item",
                        icon("chart-line", style = "color: #03b1dc;"),
                        "Analyse financière"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("shield-halved", style = "color: #03b1dc;"),
                        "Gestion et évaluation des risques"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("chart-bar", style = "color: #03b1dc;"),
                        "Construction des indicateurs financiers"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("calculator", style = "color: #03b1dc;"),
                        "Modélisations financières complexes"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("database", style = "color: #03b1dc;"),
                        "Collecte et analyse de données"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("code", style = "color: #03b1dc;"),
                        "Création des algorithmes"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("magnifying-glass-chart", style = "color: #03b1dc;"),
                        "Data mining"
                      ),
                      tags$li(
                        class = "skill-item",
                        icon("chart-simple", style = "color: #03b1dc;"),
                        "Création de tableaux de bord interactifs"
                      )
                    )
                )
              )
            ),

            # Compétences Informatiques
            div(class = "glob-tech-skills-grid",
                style = "background-color: #f8f9fa; padding: 20px; border-radius: 8px; width: 100%;",
                h3("Informatique - Logiciels - Langages de programmation",
                   style = "color: #1c116c; border-bottom: 2px solid #03b1dc; padding-bottom: 10px; font-weight: bold;"),

                div(
                  class = "tech-skills-grid",

                  # Microsoft Office
                  div(
                    class = "tech-skill-item",
                    icon("microsoft", style = "color: #03b1dc;"),
                    "Pack Microsoft Office"
                  ),

                  # VBA
                  div(
                    class = "tech-skill-item",
                    icon("file-code", style = "color: #03b1dc;"),
                    "VBA"
                  ),

                  # R
                  div(
                    class = "tech-skill-item",
                    icon("r-project", style = "color: #03b1dc;"),
                    "R / RStudio / Shiny"
                  ),

                  # Python
                  div(
                    class = "tech-skill-item",
                    icon("python", style = "color: #03b1dc;"),
                    "Python"
                  ),

                  # SAP BO
                  div(
                    class = "tech-skill-item",
                    icon("database", style = "color: #03b1dc;"),
                    "SAP BO"
                  ),

                  # Power BI
                  div(
                    class = "tech-skill-item",
                    icon("chart-pie", style = "color: #03b1dc;"),
                    "Power BI"
                  ),

                  # SAS
                  div(
                    class = "tech-skill-item",
                    icon("laptop-code", style = "color: #03b1dc;"),
                    "SAS"
                  ),

                  # Eviews
                  div(
                    class = "tech-skill-item",
                    icon("chart-line", style = "color: #03b1dc;"),
                    "Eviews"
                  ),

                  # Stata
                  div(
                    class = "tech-skill-item",
                    # tags$i(class = "fa-solid fa-analytics", style = "color: #03b1dc;"),
                    icon("chart-column", style = "color: #03b1dc;"),
                    "Stata"
                  )
                )
            )
          ) #Fin div tot
        ),
        # tabPanel("Projets", h3("Projets Réalisés", style = "color: #1c116c;")),
        tabPanel(
          # "Projets",
          "PROJETS",
          br(),
          # Projets réalisés
          h3("Projets réalisés", class = "section-title"),
          div( class = "all_project",
               style = "margin: 20px 0;",
               slickROutput("projectsCarousel", height = "400px")
          ),

          # Projets en cours et à venir
          br(),
          h3("Projets en cours et à venir", class = "section-title"),
          div(
            style = "margin: 20px 0;",
            slickROutput("futureProjectsCarousel", height = "400px")
          )
        ),
        tabPanel(
          "LANGUES & HOBBIES",
          div(class = "languages-hobbies-container",

              # Section Langues
              div(class = "language-section",
                  h3(class = "section-title", "Langues"),
                  div(class = "language-item",
                      tags$img(src = "https://flagcdn.com/w40/fr.png", class = "flag-icon"),
                      div(class = "language-info",
                          div(class = "language-name", "Français"),
                          div(class = "language-level", "Maternelle")
                      )
                  ),
                  div(class = "language-item",
                      tags$img(src = "https://flagcdn.com/w40/gb.png", class = "flag-icon"),
                      div(class = "language-info",
                          div(class = "language-name", "Anglais"),
                          div(class = "language-level", "Bien")
                      )
                  ),
                  div(class = "language-item",
                      tags$img(src = "https://flagcdn.com/w40/tg.png", class = "flag-icon"),
                      div(class = "language-info",
                          div(class = "language-name", "Éwé"),
                          div(class = "language-level", "Maternelle")
                      )
                  ),
                  div(class = "language-item",
                      tags$img(src = "https://flagcdn.com/w40/sn.png", class = "flag-icon"),
                      div(class = "language-info",
                          div(class = "language-name", "Wolof"),
                          div(class = "language-level", "Bien")
                      )
                  )
              ),

              # Section Hobbies
              div(class = "hobbies-section",
                  h3(class = "section-title", "Hobbies"),
                  div(class = "hobby-item",
                      icon("music", class = "hobby-icon"),
                      "Piano"
                  ),
                  div(class = "hobby-item",
                      icon("palette", class = "hobby-icon"),
                      "Création d'œuvres d'arts"
                  ),
                  div(class = "hobby-item",
                      icon("laptop-code", class = "hobby-icon"),
                      "Programmation et automatisation des tâches"
                  ),
                  div(class = "hobby-item",
                      icon("utensils", class = "hobby-icon"),
                      "Cuisine"
                  )
              )
          )
        )
      )
    )
  ),

  # Dans le footer, modifions les liens pour utiliser des actionLink
  div(
    class = "footer",
    div(
      class = "container",
      fluidRow( #align = "center",
        column(3, #align = "left",
               h5("CONTACT", style = "color: #03b1dc; font-weight: bold; font-size: 1.3em;"),
               tags$p(
                 class = "header-location",
                 icon("location-dot"), # Icône de localisation de Font Awesome
                 " 92220, France"
               ),
               tags$p(icon("phone"), " +33 7 80 73 36 48"),
               tags$p(icon("envelope"), " koffisessie@gmail.com"),
               tags$p(
                 icon("linkedin"), a("LinkedIn", href = "https://www.linkedin.com/in/sk-fred/", target = "_blank"),
                 " | ",
                 icon("github"), a("GitHub", href = "https://github.com/Koffi-Fredysessie/BRVM", target = "_blank"),
                 " | ",
                 icon("r-project"), a("Rpubs", href = "https://rpubs.com/Fredysessie", target = "_blank")
               )
        ),
        column(3, #align = "justify",
               h5("À PROPOS", style = "color: #03b1dc; font-weight: bold; font-size: 1.3em;"),
               tags$p("Passionné par la finance et l'analyse de données, je suis à la recherche d'opportunités passionnantes."),
               tags$p("Cherchez-vous un collaborateur pour relever vos défis? Je suis là!")

        ),
        column(3, #align = "left",
               h5("NAVIGATION", style = "color: #03b1dc; text-align: justify; font-weight: bold; font-size: 1.3em;"),
               tags$ul(
                 style = "list-style: none; padding-left: 0;",
                 tags$li(actionLink("nav_experiences", "EXPÉRIENCES", style = "color: white;")),
                 tags$li(actionLink("nav_parcours_pro", "PARCOURS ACADÉMIQUE", style = "color: white;")),
                 tags$li(actionLink("nav_competences", "COMPÉTENCES", style = "color: white;")),
                 tags$li(actionLink("nav_projets", "PROJETS", style = "color: white;")),
                 tags$li(actionLink("nav_lang_hob", "LANGUES & HOBBIES", style = "color: white;"))
               )
        ),
        column(3,
               h5("PERSPECTIVE", style = "color: #03b1dc; font-weight: bold; font-size: 1.3em;"),
               # Bouton "Me contacter"
               actionButton("showContactForm", "Me contacter",
                            style = "background-color: white; color: #1c116c;
                     border: 2px solid #1c116c;
                     transition: all 0.3s ease;
                     font-weight: bold;")

        )
      )
    )
  ),
  # Nouveau div pour le copyright
  div(class = "footer2",
      style = "background-color: #151033; color: white; text-align: center; padding: 15px 0; width: 100%;",
      HTML("Copyright © 2025. Designé et développé par Frederic SESSIE. All Rights Reserved.")
  )
)


server <- function(input, output, session) {
  output$download_cv <- downloadHandler(
    filename = function() {
      "CV_Frederic_SESSIE.pdf"
    },
    content = function(file) {
      file.copy("data/CV_Frederic SESSIE_Analyste Credits.pdf", file)
    }
  )

  # Observateurs pour la navigation
  observeEvent(input$nav_experiences, {
    updateTabsetPanel(session, "tabs", selected = "EXPÉRIENCES")
    runjs("scrollToTop();")
  })

  observeEvent(input$nav_competences, {
    updateTabsetPanel(session, "tabs", selected = "COMPÉTENCES")
    runjs("scrollToTop();")
  })

  observeEvent(input$nav_parcours_pro, {
    updateTabsetPanel(session, "tabs", selected = "PARCOURS ACADÉMIQUE")
    runjs("scrollToTop();")
  })

  observeEvent(input$nav_projets, {
    updateTabsetPanel(session, "tabs", selected = "PROJETS")
    runjs("scrollToTop();")
  })

  observeEvent(input$nav_lang_hob, {
    updateTabsetPanel(session, "tabs", selected = "LANGUES & HOBBIES")
    runjs("scrollToTop();")
  })

  # Carousel pour les projets réalisés
  output$projectsCarousel <- renderSlickR({
    projects <- list(
      list(
        title = "ESG Funds and Stocks dashboard",
        image = "esg.png",
        link = "https://koffi-sessie.shinyapps.io/ESG_app/",
        description = "Tableau de bord pour l'analyse ESG"
      ),
      list(
        title = "Weekly report on Euronext and BRVM",
        image = "stocks_analysis.png",
        link = "https://rpubs.com/Fredysessie",
        description = "Reporting hebdomadaire sur les titres cotés sur les marchés financiers Euronext et BRVM"
      ),
      list(
        title = "Comité de crédits",
        image = "com_presentation.png",
        description = "Dashboard pour la présentation des décisions de crédits lors des comités"
      ),
      list(
        title = "Package financier Euronext",
        image = "euronext.png",  # Placez l'image dans le dossier www/
        link = "https://github.com/Fredysessie/Euronext",
        description = "Package R pour l'analyse des données financières des sociétés cotées sur Euronext"
      ),
      list(
        title = "Package financier BRVM",
        image = "brvm.jpg",
        link = "https://github.com/Koffi-Fredysessie/BRVM",
        description = "Package R pour l'analyse des données financières des sociétés cotées sur la BRVM (Bourse Régionale des Valeurs Mobilières)"
      ),
      list(
        title = "Gestion des inscriptions",
        image = "school.png",
        description = "Dashboard pour la gestion des inscriptions d'un lycée"
      )
    )

    # cards <- lapply(projects, function(project) {
    #   div(
    #     class = "project-card",
    #     tags$img(src = project$image),
    #     h4(project$title),
    #     p(project$description),
    #     if (!is.null(project$link)) tags$a(href = project$link, target = "_blank", "Voir le projet")
    #   )
    # })

    cards <- lapply(projects, function(project) {
      div(
        class = "project-card",
        div(class = "project-image-container",  # Nouveau conteneur pour l'image
            tags$img(src = project$image, class = "project-image")),  # Classe ajoutée à l'image
        h4(project$title),
        p(project$description),
        if (!is.null(project$link)) tags$a(href = project$link, target = "_blank", "Voir le projet")
      )
    })

    slickR(cards, height = 400) +
      settings(
        dots = TRUE,
        infinite = TRUE,
        speed = 500,
        slidesToShow = 2,
        slidesToScroll = 1,
        autoplay = TRUE,
        autoplaySpeed = 3000
      )
  })

  # Carousel pour les projets futurs
  output$futureProjectsCarousel <- renderSlickR({
    future_projects <- list(
      list(
        title = "Tableau de bord d'analyse financière",
        image = "financial.png",
        description = "Analyse des bilans et flux de trésorerie des entreprises"
      ),
      list(
        title = "Plateforme des actions mondiales",
        image = "stocks.jpg",
        description = "Plateforme d'analyse des marchés boursiers mondiaux"
      ),
      list(
        title = "Plateforme BRVM",
        image = "brvm_platform.png",
        description = "Plateforme complète d'analyse de la BRVM"
      )
    )

    # cards <- lapply(future_projects, function(project) {
    #   div(
    #     class = "project-card",
    #     tags$img(src = project$image),
    #     h4(project$title),
    #     p(project$description)
    #   )
    # })

    cards <- lapply(future_projects, function(project) {
      div(
        class = "project-card",
        div(class = "project-image-container",  # Nouveau conteneur pour l'image
            tags$img(src = project$image, class = "project-image")),  # Classe ajoutée à l'image
        h4(project$title),
        p(project$description)
      )
    })

    slickR(cards, height = 400) +
      settings(
        dots = TRUE,
        infinite = TRUE,
        speed = 500,
        slidesToShow = 2,
        slidesToScroll = 1,
        autoplay = TRUE,
        autoplaySpeed = 3000
      )
  })


  # Ouvrir le modal au clic sur le bouton "Me contacter"
  observeEvent(input$showContactForm, {
    showModal(
      modalDialog(
        title = span("Formulaire de contact", class = "modal-title"),
        size = "m",

        div(
          style = "padding: 20px;",

          # Nom et Prénom
          tags$label("Nom et Prénom(s)", `for` = "contact_name", class = "form-label"),
          textInput("contact_name",
                    label = NULL,
                    placeholder = "Votre nom complet",
                    width = "100%"),

          # Message d'erreur pour le nom
          conditionalPanel(
            condition = "input.contact_name !== '' && /[,;:@#!?_\\-+=<>]/.test(input.contact_name)",
            tags$p("Les caractères spéciaux ne sont pas autorisés (,;:@#...)",
                   class = "error-message")
          ),
          conditionalPanel(
            condition = "input.contact_name !== '' &&
                        !/[,;:@#!?_\\-+=<>]/.test(input.contact_name) &&
                        input.contact_name.trim().split(/\\s+/).length === 1",
            tags$p("Entrée non autorisée : Au minimum 2 mots",
                   class = "error-message")
          ),
          conditionalPanel(
            condition = "input.contact_name !== '' &&
                        !/[,;:@#!?_\\-+=<>]/.test(input.contact_name) &&
                        input.contact_name.trim().split(/\\s+/).length >= 2 &&
                        input.contact_name.trim().split(/\\s+/).some(word => word.length < 2)",
            tags$p("Chaque mot doit contenir au moins 2 caractères",
                   class = "error-message")
          ),

          # Email
          tags$label("Adresse mail", `for` = "contact_email", class = "form-label"),
          textInput("contact_email",
                    label = NULL,
                    placeholder = "Votre email",
                    width = "100%"),

          # Message d'erreur pour l'email
          conditionalPanel(
            condition = "input.contact_email !== '' &&
                        !/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$/.test(input.contact_email)",
            tags$p("Email non valide",
                   class = "error-message")
          ),

          # Objet
          tags$label("Objet", `for` = "contact_object", class = "form-label"),
          selectInput("contact_object",
                      label = NULL,
                      choices = c(
                        "Sélectionnez un objet" = "",
                        "Perspective de CDI" = "CDI",
                        "Perspective de CDD" = "CDD",
                        "Perspective d'Interim" = "Interim",
                        "Autre" = "Autre"
                      ),
                      width = "100%"),

          # Message
          tags$label("Message", `for` = "contact_message", class = "form-label"),
          textAreaInput("contact_message",
                        label = NULL,
                        placeholder = "Votre message...",
                        width = "100%",
                        height = "200px"),

          # Compteur de caractères pour le message
          conditionalPanel(
            condition = "true",
            tags$p(
              textOutput("message_counter"),
              class = "message-counter"
            )
          ),

          # Message d'erreur pour le message
          conditionalPanel(
            condition = "input.contact_message !== '' &&
                        input.contact_message.trim().length < 35",
            tags$p("Le message doit contenir au moins 35 caractères",
                   class = "error-message")
          ),

          # Captcha
          div(class = "captcha-container",
              div(class = "form-check",
                  checkboxInput("captcha",
                                label = "Je suis un humain",
                                FALSE)
              )
          ),

          # Bouton d'envoi
          conditionalPanel(
            condition = "input.contact_name !== '' &&
                        !/[,;:@#!?_\\-+=<>]/.test(input.contact_name) &&
                        input.contact_name.trim().split(/\\s+/).length >= 2 &&
                        !input.contact_name.trim().split(/\\s+/).some(word => word.length < 2) &&
                        input.contact_email !== '' &&
                        /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$/.test(input.contact_email) &&
                        input.contact_object !== '' &&
                        input.contact_message.trim().length >= 35 &&
                        input.captcha === true",
            actionButton("send_mail",
                         "Envoyer",
                         class = "btn-primary")
          )
        ),
        footer = NULL,
        easyClose = TRUE
      )
    )
  })

  # Compteur de caractères pour le message
  # output$message_counter <- renderText({
  #   current_length <- nchar(input$contact_message)
  #   if(current_length < 35) {
  #     sprintf("Encore %d caractères minimum", 35 - current_length)
  #   } else {
  #     # sprintf("%d caractères", current_length)
  #     ""
  #   }
  # })

  # Gérer l'envoi du formulaire
  observeEvent(input$send_mail, {
    showNotification("Message envoyé avec succès!", type = "success")
    removeModal()
  })

  # Gestion du mode jour/nuit
  isDarkMode <- reactiveVal(FALSE)

  observeEvent(input$themeToggle, {
    isDarkMode(!isDarkMode())
    if (isDarkMode()) {
      runjs("
            document.body.classList.add('dark-mode');
            document.getElementById('themeToggle').innerHTML = '<i class=\"fa fa-moon\"></i>';
        ")
    } else {
      runjs("
            document.body.classList.remove('dark-mode');
            document.getElementById('themeToggle').innerHTML = '<i class=\"fa fa-sun\"></i>';
        ")
    }
  })



}

shinyApp(ui, server)
