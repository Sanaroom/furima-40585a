# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "price", to: "price.js"
pin "card", to:"card.js"
pin "category", to:"category.js"
pin "prefecture", to:"category.js"

pin "favo", to:"favo.js"
# pin "popup", to:"popup.js"