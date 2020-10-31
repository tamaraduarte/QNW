Dado("que acesso a página de cadastro") do
  goto_cadastro
end

Quando("submeto o meu cadastro com:") do |table|
  cadastro_with(table)
end

Então("devo ser redirecionado para a área logada") do
  expect(page).to have_css ".dashboard"
end

Então("devo ver a mensagem: {string}") do |expect_message|
  expect(cadastro_alert).to eql expect_message
end

Quando("acesso a página de cadastro") do
  steps %(
    Dado que acesso a página de cadastro
  )
end

Então("deve exibir o seguinte css: {string}") do |expect_css|
  expect(page).to have_css expect_css
end

