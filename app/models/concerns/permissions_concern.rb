module PermissionsConcern
	extended ActiveSupport::Concern

	def is_usuario?
		self.permission_level >= 1
	end

  def is_asistente?
    self.permission_level >= 2
  end

	def is_admin?
		self.permission_level >= 1
	end	
end