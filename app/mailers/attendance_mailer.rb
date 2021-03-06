class AttendanceMailer < ApplicationMailer
  default from: 'dudu@yopmail.com'

  def attendance_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance
    @user = @attendance.user # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet. #on définit une variable @url qu'on utilisera dans la view d’e-mail
    mail(
      to: @attendance.event.admin.email, subject: 'Bienvenue dans ton event !'
    )
  end
end
