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
  get 'borradores' => 'operations#borradores'
  get 'impresas' => 'operations#impresas'
  get 'pagadas' => 'operations#pagadas'
  get 'canceladas' => 'operations#canceladas'
  #Compras
  get 'compras' => 'operations#compras'
  get 'compras/borrador' => 'operations#compras_borrador'
  get 'compras/impresas' => 'operations#compras_impresas'
  get 'compras/contado' => 'operations#compras_contado'
  get 'compras/credito' => 'operations#compras_credito'
  #Ventas
  get 'ventas' => 'operations#ventas'
  get 'ventas/borrador' => 'operations#ventas_borrador'
  get 'ventas/impresas' => 'operations#ventas_impresas'
  get 'ventas/contado' => 'operations#ventas_contado'
  get 'ventas/credito' => 'operations#ventas_credito'

  #Clientes 
  get 'clientes' => 'clients#clientes'
  get 'clientes/recurrentes' => 'clients#clientes_recurrentes'
  get 'clientes/puntuales' => 'clients#clientes_puntuales'
  #Proveedores
  get 'proveedores' => 'clients#proveedores'
  get 'proveedores/recurrentes' => 'clients#proveedores_recurrentes'
  get 'proveedores/puntuales' => 'clients#proveedores_puntuales'
  #Sponsors
  get 'sponsors' => 'clients#sponsors'
  get 'sponsors/recurrentes' => 'clients#sponsors_recurrentes'
  get 'sponsors/puntuales' => 'clients#sponsors_puntuales'


end
