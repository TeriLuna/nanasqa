# SDK de Mercado Pago
require 'mercadopago.rb'

# Agrega credenciales
$mercado_pago = MercadoPago.new(ENV['MERCADO_PAGO_ACCESS_TOKEN'])

# preference_data = {
#   "items": [
#     {
#       "title": "Mi producto",
#       "unit_price": 100,
#       "quantity": 1
#     }
#   ]
# }

# preference = $mercado_pago.create_preference(preference_data)

# preference.back_urls = {
#   success: "https://www.tu-sitio/success",
#   failure: "http://www.tu-sitio/failure",
#   pending: "http://www.tu-sitio/pendings"
# }

# preference.auto_return = "approved"

# # Este valor reemplazará el string "<%= @preference_id %>" en tu HTML
# @preference_id = preference["response"]["id"]
