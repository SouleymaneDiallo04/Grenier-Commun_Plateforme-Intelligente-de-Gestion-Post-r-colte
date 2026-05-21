============================================================
  GRENIER COMMUN — Liste des captures d'écran requises
  Dossier : screenshots/
  Date de création : Mai 2026
============================================================

Ce fichier liste exactement les 15 captures d'écran PNG à placer
dans ce dossier pour compiler le rapport LaTeX complet.
Toutes les images doivent être en format PNG, résolution minimale
1280×800 px, nommées EXACTEMENT comme indiqué ci-dessous.

------------------------------------------------------------
01. accueil_publique.png
    URL Django    : /fr/  (page d'accueil publique, non connecté)
    Vue           : apps/core/views.py → index_view
    Template      : templates/core/index.html
    Éléments à capturer :
      - Hero section avec titre "Grenier Commun" et CTA
      - Section statistiques (nb agriculteurs, nb silos, nb transactions)
      - Section "Comment ça marche" (3 étapes illustrées)
      - Navigation top avec logo et boutons Connexion/Inscription
      - Fond vert #287850, boutons en orange #C89620

------------------------------------------------------------
02. connexion_inscription.png
    URL Django    : /fr/auth/connexion/
    Vue           : apps/accounts/views.py → connexion_view
    Template      : templates/accounts/connexion.html
    Éléments à capturer :
      - Formulaire de connexion (téléphone + mot de passe)
      - Lien "Créer un compte" visible
      - Message d'erreur ou validation
      - Logo Grenier Commun en haut

------------------------------------------------------------
03. dashboard_agriculteur.png
    URL Django    : /fr/agriculteur/dashboard/
    Vue           : apps/agriculteurs/views.py → dashboard_view
    Template      : templates/agriculteurs/dashboard.html
    Éléments à capturer :
      - Sidebar gauche repliée/dépliée avec menu de navigation
      - 4 KPI cards : stocks actifs, valeur totale FCFA, crédit dispo, score crédit
      - Tableau liste des 3 derniers dépôts
      - Section recommandations IA (badge VENDRE/ATTENDRE)
      - Graphique prix du marché (si chart.js intégré)

------------------------------------------------------------
04. detail_depot_agriculteur.png
    URL Django    : /fr/agriculteur/depot/<id>/
    Vue           : apps/agriculteurs/views.py → depot_detail_view
    Template      : templates/agriculteurs/depot_detail.html
    Éléments à capturer :
      - Numéro de reçu (format GC-YYYYMM-#####)
      - Informations dépôt : denrée, quantité, silo, date, valeur estimée
      - Bouton "Demander un warrantage" (si dépôt ACTIF)
      - Section traduction inline des informations
      - Statut visuel (badge coloré ACTIF/WARRANTE/RETIRE)

------------------------------------------------------------
05. formulaire_warrantage.png
    URL Django    : /fr/warrantage/nouvelle-demande/
    Vue           : apps/warrantage/views.py → nouvelle_demande_view
    Template      : templates/warrantage/nouvelle_demande.html
    Éléments à capturer :
      - Formulaire de demande (sélection dépôt, montant demandé)
      - Simulation crédit en temps réel (HTMX) :
          Valeur estimée : X FCFA
          Montant warrantable (70%) : Y FCFA
          Montant demandé : Z FCFA
          Taux mensuel IMF : 2%
          Durée : 3 mois
          Remboursement total estimé : W FCFA
      - Bouton de soumission

------------------------------------------------------------
06. dashboard_gestionnaire_silo.png
    URL Django    : /fr/gestionnaire/dashboard/
    Vue           : apps/silos/views.py → dashboard_gestionnaire_view
    Template      : templates/silos/dashboard.html
    Éléments à capturer :
      - Statistiques silos (taux de remplissage, nb dépôts actifs)
      - Jauge visuelle de remplissage par silo (barre de progression)
      - Tableau des alertes silo actives (ROUGE/ORANGE)
      - Conditions environnementales : température °C, humidité %
      - Indicateur santé silo (vert/orange/rouge)

------------------------------------------------------------
07. formulaire_nouveau_depot.png
    URL Django    : /fr/gestionnaire/nouveau-depot/
    Vue           : apps/silos/views.py → nouveau_depot_view
    Template      : templates/silos/nouveau_depot.html
    Éléments à capturer :
      - Formulaire complet : sélection agriculteur, denrée, quantité, silo
      - Prix unitaire estimé au marché (FCFA/tonne)
      - Calcul automatique valeur estimée
      - Bouton génération reçu PDF après validation

------------------------------------------------------------
08. dashboard_admin_gc.png
    URL Django    : /fr/administration/dashboard/
    Vue           : apps/administration/views.py → dashboard_admin_view
    Template      : templates/administration/dashboard.html
    Éléments à capturer :
      - Carte Leaflet.js avec marqueurs géolocalisés des silos
      - KPIs globaux : total agriculteurs, total FCFA stocké, nb warrantages
      - Graphique évolution mensuelle (Chart.js ou SVG)
      - Tableau récapitulatif des 5 dernières transactions
      - Alertes actives compteur (badge rouge)

------------------------------------------------------------
09. module_traduction.png
    URL Django    : /fr/traduction/traduire/
    Vue           : apps/traduction/views.py → traduction_view
    Template      : templates/traduction/traduction.html
    Éléments à capturer :
      - Formulaire : zone texte source + sélecteur langue source
      - Sélecteur langue cible (FR, EN, Wolof, Arabe)
      - Résultat de traduction (après HTMX → hx-post)
      - Historique des 5 dernières traductions
      - Indicateur du moteur utilisé (NLLB-200 ou Google Translate)

------------------------------------------------------------
10. catalogue_acheteur.png
    URL Django    : /fr/marche/catalogue/
    Vue           : apps/marche/views.py → catalogue_view
    Template      : templates/marche/catalogue.html
    Éléments à capturer :
      - Grille de stocks disponibles à la vente
      - Filtres : denrée, région, quantité min, prix max
      - Chaque card : denrée, quantité dispo, prix/kg, localisation silo
      - Bouton "Faire une offre" sur chaque card
      - Pagination

------------------------------------------------------------
11. dashboard_imf.png
    URL Django    : /fr/imf/dashboard/
    Vue           : apps/imf/views.py → dashboard_imf_view
    Template      : templates/imf/dashboard.html
    Éléments à capturer :
      - File d'attente : dossiers SOUMIS en attente d'instruction
      - Tableau dossiers EN_INSTRUCTION avec score crédit IA
      - Statistiques : nb approuvés / refusés / en cours ce mois
      - Filtres par statut (SOUMIS, EN_INSTRUCTION, APPROUVE…)

------------------------------------------------------------
12. widget_chatbot.png
    URL Django    : rendu via template tags dans base.html
    Vue           : apps/chatbot/views.py → chat_api
    Template      : templates/chatbot/partials/chatbot_widget.html
    Éléments à capturer :
      - Bouton flottant (icône robot, couleur gcvert)
      - Panel chatbot ouvert (côté droit ou bas d'écran)
      - Conversation exemple : question agriculteur en français/wolof
      - Réponse Claude Haiku avec données réelles (stocks, recommandations)
      - Sélecteur de langue EN tête de panel

------------------------------------------------------------
13. gestion_warrantage_admin.png
    URL Django    : /fr/administration/warrantages/
    Vue           : apps/administration/views.py → warrantage_list_view
    Template      : templates/administration/warrantage_list.html
    Éléments à capturer :
      - Tableau de tous les dossiers warrantage (toutes IMF confondues)
      - Colonnes : N° dossier, Agriculteur, Montant, IMF, Statut, Date
      - Bouton "Transmettre à IMF" pour dossiers SOUMIS
      - Badges colorés par statut (7 statuts)
      - Export Excel ou PDF des dossiers

------------------------------------------------------------
14. prix_marche_agriculteur.png
    URL Django    : /fr/marche/prix/
    Vue           : apps/marche/views.py → prix_marche_view
    Template      : templates/marche/prix.html
    Éléments à capturer :
      - Tableau des cours actuels par denrée et région
      - Évolution sur 4 semaines (graphique sparkline ou tableau)
      - Recommandation IA : "VENDRE maintenant" ou "ATTENDRE X semaines"
      - Badge recommandation coloré (vert=vendre, orange=attendre)
      - Date de dernière mise à jour

------------------------------------------------------------
15. decision_imf.png
    URL Django    : /fr/imf/dossier/<id>/
    Vue           : apps/imf/views.py → dossier_detail_view
    Template      : templates/imf/dossier_detail.html
    Éléments à capturer :
      - Fiche complète du dossier :
          Agriculteur, dépôt en garantie, montant demandé
          Score crédit IA (jauge visuelle)
          Historique warrantages précédents
      - Formulaire décision : Approuver (montant accordé) ou Refuser (motif)
      - Simulation remboursement (montant × taux × durée)
      - Bouton "Valider la décision"

============================================================
INSTRUCTIONS DE NOMMAGE
============================================================
- Tous les fichiers : format PNG uniquement
- Résolution : 1280×800 px minimum (1920×1080 recommandé)
- Langue de l'interface sur les captures : français (URL /fr/...)
- Fond d'interface : blanc ou gris clair (#F9FAFB)
- Ne pas inclure la barre d'adresse du navigateur dans la capture
- Capturer avec des données de test réalistes (pas de données vides)

Pour faire les captures :
  python manage.py loaddata fixtures/demo_data.json
  python manage.py runserver
  Naviguer sur http://localhost:8000/fr/...
  Outil capture : Windows Snipping Tool ou navigateur DevTools

============================================================
