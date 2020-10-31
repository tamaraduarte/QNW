Dado("login com {string} e {string}") do |email, password|
    goto_login
    login_with(email,password)
end
  
Dado("que eu gosto muito de {string}") do |cat|
    goto_categoria(cat)
end
  
Quando("toco a seguinte canção:") do |table|
   goto_song(table)
end
  
Então("essa paródia deve ficar em modo de reprodução") do
    goto_play
end