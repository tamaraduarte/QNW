module Actions

  #Login
  def goto_login
    visit "/"
    click_on "Login"
  end

  def login_with(email, senha)
    find("#user_email").set email
    find("#user_password").set senha
    click_on "Log in"
  end

  def login_alert
    return find(".message .message-body").text
  end

  #Cadastro
  def goto_cadastro
    visit "/"
    click_on "EXPERIMENTE AGORA"
  end

  def cadastro_with(table)
    user = table.rows_hash

    delorean user[:email]

    find("input[name*=email]").set user[:email]
    find("input[placeholder='Sua senha secreta']").set user[:senha]
    find("input[placeholder='Confirme a senha']").set user[:senha_confirma]

    click_on "Cadastrar"
  end

  def cadastro_alert
    return find(".message p").text
  end

  #Player
  def goto_categoria(cat)
    find("a[href='/search/new']").click
    find("img[src$='#{cat.downcase}.png']").click
  end

  def goto_song(table)
    @parody = table.rows_hash

    find("a", text: @parody[:banda]).click

    song = find(".song-item", text: @parody[:parodia])
    song.find(".fa-play-circle").click
  end

  def goto_play
    song_play = find(".playing")
    expect(song_play).to have_text @parody[:parodia]
  end
end
