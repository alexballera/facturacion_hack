class OperationMailer < ApplicationMailer
  def new_operation(operation)
    @operation = operation
    mail(to: @operation.client.email, subject: "#{@operation.client.nombre} te envio el comprobante de #{@operation.operacion.downcase} numero #{@operation.id}")
  end
end
