class OperationMailer < ApplicationMailer
  def new_operation(operation)
    @operation = operation
    mail(to: @operation.client.email, subject: "#{@operation.client.nombre} le envio el comprobante de #{@operation.operacion.downcase} numero #{@operation.id}")
  end
end
