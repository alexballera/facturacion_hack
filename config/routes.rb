Rails.application.routes.draw do
  root 'welcome#index' 
	
  devise_for :users
  resources :clients 
  resources :products
  get "/dashboard" => "welcome#dashboard"
  #OPERACIONES
  resources :operations
  put "/operations/:id/print" => "operations#print"
  put "/operations/:id/pay" => "operations#pay"
  put "/operations/:id/cancel" => "operations#cancel"
  get 'facturas/borrador' => 'operations#borrador'
  get 'facturas/impresas' => 'operations#impresas'
  get 'facturas/pagadas' => 'operations#pagadas'
  get 'facturas/canceladas' => 'operations#canceladas'
  #Compras
  get 'compras' => 'operations#compras'
  get 'compras/facturas/borrador' => 'operations#compras_borrador'
  get 'compras/facturas/impresas' => 'operations#compras_impresas'
  get 'compras/contado' => 'operations#compras_contado'
  get 'compras/credito' => 'operations#compras_credito'
  #Ventas
  get 'ventas' => 'operations#ventas'
  get 'ventas/facturas/borrador' => 'operations#ventas_borrador'
  get 'ventas/facturas/impresas' => 'operations#ventas_impresas'
  get 'ventas/contado' => 'operations#ventas_contado'
  get 'ventas/credito' => 'operations#ventas_credito'

  #Clientes 
  get 'clientes' => 'clients#clientes'
  get 'clientes/recurrentes' => 'clients#clientes_recurrentes'
  get 'clientes/puntuales' => 'clients#clientes_puntuales'
  #Proveedores
  get 'proveedores' => 'clients#proveedores'
  get 'proveedores/recurrentes' => 'clients#proveedores_recurrentes'
  get 'proveedores/punctuales' => 'clients#proveedores_puntuales'
  #Sponsors
  get 'sponsors' => 'clients#sponsors'
  get 'sponsors/recurrent' => 'clients#sponsor_recurrentes'
  get 'sponsors/punctual' => 'clients#sponsor_puntuales'


end
