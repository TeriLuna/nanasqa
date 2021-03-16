# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join('fonts')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile +=
  %w(
      plugins/bootstrap/bootstrap.min.css
      plugins/owl-carousel/owl.carousel.min.css
      plugins/owl-carousel/owl.theme.default.min.css
      plugins/magnific-popup/magnific-popup.min.css
      plugins/sal/sal.min.css
      theme.css
      plugins/font-awesome/css/all.css
      plugins/themify/themify-icons.css
      plugins/simple-line-icons/css/simple-line-icons.css
      chat.css
      daterangepicker.css

      plugins/font-awesome/webfonts/fa-brands-400.eot
      plugins/font-awesome/webfonts/fa-brands-400.svg
      plugins/font-awesome/webfonts/fa-brands-400.ttf
      plugins/font-awesome/webfonts/fa-brands-400.woff
      plugins/font-awesome/webfonts/fa-brands-400.woff2

      plugins/font-awesome/webfonts/fa-regular-400.eot
      plugins/font-awesome/webfonts/fa-regular-400.svg
      plugins/font-awesome/webfonts/fa-regular-400.ttf
      plugins/font-awesome/webfonts/fa-regular-400.woff
      plugins/font-awesome/webfonts/fa-regular-400.woff2

      plugins/font-awesome/webfonts/fa-solid-900.eot
      plugins/font-awesome/webfonts/fa-solid-900.svg
      plugins/font-awesome/webfonts/fa-solid-900.ttf
      plugins/font-awesome/webfonts/fa-solid-900.woff
      plugins/font-awesome/webfonts/fa-solid-900.woff2

      plugins/magnific-popup/*
      plugins/owl-carousel/*
      plugins/simple-line-icons/css/*
      plugins/simple-line-icons/fonts/*
      plugins/themify/**/*

      jquery.min.js
      images_loaded.js
      appear.min.js
      plugins.js
      functions.js
      reservations/form.js
      reservations/show.js
      moment.js
      daterangepicker.js
    )
