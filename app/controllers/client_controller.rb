class ClientController < ApplicationController
  def home
    if params[:codigo_rastreio].present?
      conn = Faraday.new(url: 'http://localhost:3000')
      response = conn.get("rastreio/#{params[:codigo_rastreio]}")
      @order = JSON.parse(response.body)
      puts @order
    else
      flash[:alert] = "Pedido não encontrado."
    end
  end

  def order
  end

end
