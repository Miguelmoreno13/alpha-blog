class UserMailer < ApplicationMailer
  
  def forgot_password(user)
    @usuario = user
    @greeting = "Hola"
    mail to: user.email, :subject => 'Instrucciones de recuperacion de contraseña'
  end
end
