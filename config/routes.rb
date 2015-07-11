Rails.application.routes.draw do
  root 'welcome#index' 
	
  devise_for :users
  resources :clients 
  resources :operations
  resources :products

  #Operaciones-Compras
  get 'compras' => 'operations#compras'
  get 'compras/borrador' => 'operations#compras_borrador'
  get 'compras/factura' => 'operations#compras_factura'
  get 'compras/contado' => 'operations#compras_contado'
  get 'compras/credito' => 'operations#compras_credito'

  #Operaciones-Ventas
  get 'ventas' => 'operations#ventas'
  get 'ventas/borrador' => 'operations#ventas_borrador'
  get 'ventas/factura' => 'operations#ventas_factura'
  get 'ventas/contado' => 'operations#ventas_contado'
  get 'ventas/credito' => 'operations#ventas_credito'
end
